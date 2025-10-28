package com.monrab.ecommerce.security.services;

import com.monrab.ecommerce.models.Notification;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.repository.NotificationRepository;
import com.monrab.ecommerce.repository.UserRepository;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private UserRepository userRepository;

    public Notification createNotification(String title, String description, UUID userId, boolean sendEmail) {
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        System.out.println("Creando notificación para usuario ID: " + userId);
        Notification notification = new Notification();
        notification.setTitle(title);
        notification.setDescription(description);
        notification.setUser(user);
        notification.setSeen(false);

        notificationRepository.save(notification);

        if (sendEmail) {
            sendNotificationEmail(user.getEmail(), title, description);
        }

        return notification;
    }

    private void sendNotificationEmail(String to, String subject, String message) {
        System.out.println("Enviando correo a: " + to);
        SimpleMailMessage mail = new SimpleMailMessage();
        mail.setTo(to);
        mail.setSubject(subject);
        mail.setText(message);
        mailSender.send(mail);
    }

    public boolean markAsSeen(Integer id) {
        Notification notification = notificationRepository.findById(id).orElse(null);
        if (notification == null) {
            return false;
        }
        notification.setSeen(true);
        notificationRepository.save(notification);
        return true;
    }
}