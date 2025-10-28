package com.monrab.ecommerce.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monrab.ecommerce.models.Notification;
import com.monrab.ecommerce.payload.request.NotificationRequest;
import com.monrab.ecommerce.repository.NotificationRepository;
import com.monrab.ecommerce.security.services.NotificationService;
import com.monrab.ecommerce.security.services.UserDetailsImpl;

@RestController
@RequestMapping("/api/notifications")
public class NotificationController {
    @Autowired
    private NotificationRepository notificationRepository;
    @Autowired
    private NotificationService notificationService;

    @GetMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> getAllNotifications() {
        List<Notification> notifications = notificationRepository.findAll();
        return ResponseEntity.ok(notifications);
    }

    @GetMapping("/my-notifications")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> getNotificationByUser(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<Notification> notifications = notificationRepository.findByUserId(userDetails.getId());
        return ResponseEntity.ok(notifications);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getNotificationById(@PathVariable Integer id) {
        Optional<Notification> notification = notificationRepository.findById(id);
        return ResponseEntity.ok(notification.get());
    }

    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
    public ResponseEntity<?> createNotification(@RequestBody NotificationRequest request) {
        Notification notification = notificationService.createNotification(request.getTitle(), request.getDescription(), request.getUserId(), request.isSendEmail());
        return ResponseEntity.ok(notification);
    }

    @PutMapping("/mark-as-seen/{id}")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> markAsSeen(@PathVariable Integer id) {
        boolean updated = notificationService.markAsSeen(id);
        if (!updated) {
            return ResponseEntity.badRequest().body("No se pudo marcar la notificación como vista");
        }
        return ResponseEntity.ok("Notificación marcada como vista correctamente");
    }
}
