package com.monrab.ecommerce.controllers;

import com.monrab.ecommerce.models.ERole;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.payload.request.UserUpdateRequest;
import com.monrab.ecommerce.payload.response.UserProfileResponse;
import com.monrab.ecommerce.repository.LogsRepository;
import com.monrab.ecommerce.security.services.ReportService;
import com.monrab.ecommerce.security.services.UserService;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    UserService userService;
    @Autowired
    LogsRepository logsRepository;
    @Autowired
    ReportService reportService;

    @GetMapping("/empleados")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> getEmpleados() {
        List<User> employees = new ArrayList<>();
        employees.addAll(userService.getUserByRole(ERole.ROLE_MODERATOR));
        employees.addAll(userService.getUserByRole(ERole.ROLE_LOGISTIC));

        List<UserProfileResponse> employeesSave = employees.stream()
                .map(user -> new UserProfileResponse(
                        user.getId(),
                        user.getUsername(),
                        user.getEmail(),
                        user.getPerson().getDpi(),
                        user.getPerson().getFirst_name(),
                        user.getPerson().getLast_name(),
                        user.getPerson().getAddress(),
                        user.getPerson().getPhone(),
                        0.00))
                .toList();

        return ResponseEntity.ok(employeesSave);
    }

    @GetMapping("/todos-usuarios")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> getTodosUsuarios() {
        List<User> users = userService.getAllUsers();
        List<UserProfileResponse> usersSave = users.stream()
                .map(user -> new UserProfileResponse(
                        user.getId(),
                        user.getUsername(),
                        user.getEmail(),
                        user.getPerson().getDpi(),
                        user.getPerson().getFirst_name(),
                        user.getPerson().getLast_name(),
                        user.getPerson().getAddress(),
                        user.getPerson().getPhone(),
                        0.00))
                .toList();

        return ResponseEntity.ok(usersSave);
    }

    @GetMapping("/usuarios")
    @PreAuthorize("hasRole('ADMIN') or hasRole('MODERATOR')")
    public ResponseEntity<?> getUsuarios() {
        List<User> users = userService.getUserByRole(ERole.ROLE_USER);
        List<UserProfileResponse> usersSave = users.stream()
                .map(user -> new UserProfileResponse(
                        user.getId(),
                        user.getUsername(),
                        user.getEmail(),
                        user.getPerson().getDpi(),
                        user.getPerson().getFirst_name(),
                        user.getPerson().getLast_name(),
                        user.getPerson().getAddress(),
                        user.getPerson().getPhone(),
                        0.00))
                .toList();

        return ResponseEntity.ok(usersSave);
    }

    @GetMapping("/logs")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> getLogs() {
        return ResponseEntity.ok(logsRepository.findAll());
    }

    @PutMapping("/empleados/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> updateProfile(@RequestBody UserUpdateRequest updateRequest, @PathVariable UUID id) {
        userService.updateProfileById(id, updateRequest);
        return ResponseEntity.ok("Actualización completa");
    }
}
