package com.monrab.ecommerce.security.services;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.monrab.ecommerce.models.ERole;
import com.monrab.ecommerce.models.Person;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.payload.request.UserUpdateRequest;
import com.monrab.ecommerce.repository.UserRepository;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    @Transactional
    public User updateProfile(String username, UserUpdateRequest request) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        if (request.getEmail() != null && !request.getEmail().isBlank()) {
            user.setEmail(request.getEmail());
        }

        Person person = user.getPerson();
        if (person != null) {
            if (request.getFirstName() != null)
                person.setFirst_name(request.getFirstName());
            if (request.getLastName() != null)
                person.setLast_name(request.getLastName());
            if (request.getPhone() != null)
                person.setPhone(request.getPhone());
            if (request.getAddress() != null)
                person.setAddress(request.getAddress());
        }

        return userRepository.save(user);
    }

    @Transactional
    public User updateProfileById(UUID id, UserUpdateRequest request) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        if (request.getEmail() != null && !request.getEmail().isBlank()) {
            user.setEmail(request.getEmail());
        }

        Person person = user.getPerson();
        if (person != null) {
            if (request.getFirstName() != null)
                person.setFirst_name(request.getFirstName());
            if (request.getLastName() != null)
                person.setLast_name(request.getLastName());
            if (request.getPhone() != null)
                person.setPhone(request.getPhone());
            if (request.getAddress() != null)
                person.setAddress(request.getAddress());
        }

        return userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public List<User> getUserByRole(ERole role) {
        return userRepository.findByRoles_Name(role);
    }
}