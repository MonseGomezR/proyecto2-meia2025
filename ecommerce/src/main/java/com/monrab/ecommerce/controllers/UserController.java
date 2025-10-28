package com.monrab.ecommerce.controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

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
import com.monrab.ecommerce.payload.response.UserProfileResponse;
import com.monrab.ecommerce.repository.OrderItemRepository;
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
    @Autowired
    OrderItemRepository orderService;

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
        //Double ganancias = orderService.calcularGananciaPorUsuario(userDetails.getId());
        UserProfileResponse profile = userRepository.findById(userDetails.getId()).map(user -> {
            Person person = user.getPerson();
            return new UserProfileResponse(
                    user.getId(),
                    user.getUsername(),
                    user.getEmail(),
                    person.getDpi(),
                    person.getFirst_name(),
                    person.getLast_name(),
                    person.getAddress(),
                    person.getPhone(),
                    user.getGanancias()
            );
        }).orElse(null);
        if (profile == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
        }
        return ResponseEntity.ok(profile);
    }

    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> createUser(@RequestBody SignupRequest signUpRequest) {
        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Email is already in use!"));
        }

        Person person = new Person();
        person.setDpi(signUpRequest.getDpi());
        person.setFirst_name(signUpRequest.getFirstName());
        person.setLast_name(signUpRequest.getLastName());
        person.setPhone(signUpRequest.getPhone());
        person.setAddress(signUpRequest.getAddress());

        User user = new User(signUpRequest.getUsername(), signUpRequest.getEmail(),
                encoder.encode(signUpRequest.getPassword()), person, null);


        Set<String> strRoles = signUpRequest.getRole();
        Set<Role> roles = new HashSet<>();

        if (strRoles == null) {
            Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                    .orElseThrow(() -> {
                        return new RuntimeException("Error: Role is not found.");
                    });
            roles.add(userRole);
        } else {
            strRoles.forEach(role -> {
                switch (role) {
                    case "admin":
                        Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
                                .orElseThrow(() -> {
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(adminRole);
                        break;
                    case "mod":
                        Role modRole = roleRepository.findByName(ERole.ROLE_MODERATOR)
                                .orElseThrow(() -> {
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(modRole);
                        break;

                    case "logic":
                        Role logicRole = roleRepository.findByName(ERole.ROLE_LOGISTIC)
                                .orElseThrow(() -> {
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(logicRole);
                        break;
                    default:
                        Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                                .orElseThrow(() -> {
                                    return new RuntimeException("Error: Role is not found.");
                                });
                        roles.add(userRole);
                }
            });
        }


        user.setRoles(roles);
        userRepository.save(user);

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

    public Double calcularGanancia(UUID userId) {
        Double ganancia = orderService.calcularGananciaPorUsuario(userId);
        return ganancia != null ? ganancia : 0.0;
    }

}
