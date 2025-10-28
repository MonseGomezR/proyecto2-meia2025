package com.monrab.ecommerce.controllers;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import jakarta.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monrab.ecommerce.models.*;
import com.monrab.ecommerce.payload.request.LoginRequest;
import com.monrab.ecommerce.payload.request.SignupRequest;
import com.monrab.ecommerce.payload.response.JwtResponse;
import com.monrab.ecommerce.payload.response.MessageResponse;
import com.monrab.ecommerce.repository.PersonRepository;
import com.monrab.ecommerce.repository.RoleRepository;
import com.monrab.ecommerce.repository.UserRepository;
import com.monrab.ecommerce.security.jwt.JwtUtils;
import com.monrab.ecommerce.security.services.UserDetailsImpl;

/*
 * Controlador de la autenticación, login y registro
 */

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    // --- Inyecciones ---
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PersonRepository personRepository;
    @Autowired
    private PasswordEncoder encoder;
    @Autowired
    private JwtUtils jwtUtils;

    // POST: /api/auth/login
    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
        try {
            logger.info("Login request: {}", loginRequest.getUsername());
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = jwtUtils.generateJwtToken(authentication);

            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            List<String> roles = userDetails.getAuthorities().stream()
                    .map(item -> item.getAuthority())
                    .collect(Collectors.toList());
            logger.info("Login success");
            return ResponseEntity.ok(
                    new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(), userDetails.getEmail(),
                            roles, userDetails.getPerson()));
        } catch (DisabledException e) {
            Map<String, String> body = new HashMap<>();
            body.put("error", "USER_DISABLED");
            body.put("message", "Tu cuenta está deshabilitada. Contacta al administrador.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(body);
        } catch (Exception e) {
            logger.error("Authentication error: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
        }
    }

    // POST: /api/auth/register
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {

        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            Map<String, String> body = new HashMap<>();
            body.put("error", "USERNAME_TAKEN");
            body.put("message", "Ya existe un usuario con ese nombre. Por favor elige otro.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(body);
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            Map<String, String> body = new HashMap<>();
            body.put("error", "EMAIL_TAKEN");
            body.put("message", "Ya existe un usuario con ese correo electrónico. Por favor elige otro.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(body);
        }

        if (signUpRequest.getDpi().length() < 13) {
            Map<String, String> body = new HashMap<>();
            body.put("error", "INVALID_DPI");
            body.put("message", "El DPI debe tener al menos 13 caracteres.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(body);
        }

        if (personRepository.existsByDpi(signUpRequest.getDpi())) {
            Map<String, String> body = new HashMap<>();
            body.put("error", "DPI_TAKEN");
            body.put("message", "Ya existe una persona registrada con este DPI.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(body);
        }

        Person person = new Person();
        person.setDpi(signUpRequest.getDpi());
        person.setFirst_name(signUpRequest.getFirstName());
        person.setLast_name(signUpRequest.getLastName());
        person.setPhone(signUpRequest.getPhone());
        person.setAddress(signUpRequest.getAddress());

        Cart cart = new Cart();

        User user = new User(signUpRequest.getUsername(), signUpRequest.getEmail(),
                encoder.encode(signUpRequest.getPassword()), person, cart);

        Set<Role> roles = new HashSet<>();

        Role userRole = roleRepository.findByName(ERole.ROLE_USER).orElseThrow(() -> {
            return new RuntimeException("Error: Role is not found.");
        });

        roles.add(userRole);

        user.setRoles(roles);
        userRepository.save(user);

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

}
