package com.monrab.ecommerce.controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import com.monrab.ecommerce.models.ERole;
import com.monrab.ecommerce.models.Person;
import com.monrab.ecommerce.models.Role;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.payload.request.SignupRequest;
import com.monrab.ecommerce.payload.request.UserUpdateRequest;
import com.monrab.ecommerce.payload.response.MessageResponse;
import com.monrab.ecommerce.repository.RoleRepository;
import com.monrab.ecommerce.repository.UserRepository;
import com.monrab.ecommerce.security.services.UserDetailsImpl;
import com.monrab.ecommerce.security.services.UserService;



@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    UserService userService;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    PasswordEncoder encoder;

    static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> getAll() {
        try {
            List<User> users = new ArrayList<>();

            userRepository.findAll().forEach(users::add);

            if (users.isEmpty())
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);

            return new ResponseEntity<>(users, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> getMe(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        return ResponseEntity.ok(userDetails);
    }

    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> createUser(@RequestBody SignupRequest signUpRequest) {
        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            logger.warn("Username already exists: {}", signUpRequest.getUsername());
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            logger.warn("Email already in use: {}", signUpRequest.getEmail());
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Email is already in use!"));
        }

        Person person = new Person(signUpRequest.getDpi(), signUpRequest.getFirstName(),
                signUpRequest.getLastName(), signUpRequest.getPhone(), signUpRequest.getAddress());

        User user = new User(signUpRequest.getUsername(), signUpRequest.getEmail(),
                encoder.encode(signUpRequest.getPassword()), person, null);

        logger.info("Password encoded successfully");

        Set<String> strRoles = signUpRequest.getRole();
        Set<Role> roles = new HashSet<>();

        if (strRoles == null) {
            logger.info("No roles provided, using default ROLE_USER");
            Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                    .orElseThrow(() -> {
                        logger.error("ROLE_USER not found in DB!");
                        return new RuntimeException("Error: Role is not found.");
                    });
            roles.add(userRole);
        } else {
            strRoles.forEach(role -> {
                logger.info("Processing role: {}", role);
                switch (role) {
                    case "admin":
                        Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
                                .orElseThrow(() -> {
                                    logger.error("ROLE_ADMIN not found in DB!");
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(adminRole);
                        break;
                    case "mod":
                        Role modRole = roleRepository.findByName(ERole.ROLE_MODERATOR)
                                .orElseThrow(() -> {
                                    logger.error("ROLE_MODERATOR not found in DB!");
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(modRole);
                        break;

                    case "logic":
                        Role logicRole = roleRepository.findByName(ERole.ROLE_LOGISTIC)
                                .orElseThrow(() -> {
                                    logger.error("ROLE_LOGISTIC not found in DB!");
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(logicRole);
                        break;
                    default:
                        Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                                .orElseThrow(() -> {
                                    logger.error("ROLE_USER not found in DB!");
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(userRole);
                }
            });
        }

        logger.info("Roles assigned: {}", roles.stream().map(Role::getName).toList());

        user.setRoles(roles);
        userRepository.save(user);
        logger.info("User saved successfully: {}", user.getUsername());

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

    @PutMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> updateProfile(@RequestBody UserUpdateRequest updateRequest, @AuthenticationPrincipal UserDetailsImpl userDetails) {
        userService.updateProfile(userDetails.getUsername(), updateRequest);
        return ResponseEntity.ok("Actualizacion completa");
    }

    @PatchMapping("/{id}/toggle-active")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> toggleUserActive(@PathVariable UUID id) {
        User user = userRepository.findById(id).orElse(null);
        if (user == null)
            return ResponseEntity.badRequest().body("Usuario no encontrado");

        user.setActive(!user.isActive());
        userRepository.save(user);
        return ResponseEntity.ok("Estado de usuario cambiado a: " + (user.isActive() ? "Activo" : "Inactivo"));
    }

}
