package com.monrab.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import com.monrab.ecommerce.models.Card;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.repository.CardRepository;
import com.monrab.ecommerce.repository.UserRepository;
import com.monrab.ecommerce.security.services.UserDetailsImpl;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/cards")
public class CardControler {
    @Autowired
    CardRepository cardRepository;
    @Autowired
    UserRepository userRepository;

    @GetMapping("")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getMyCards(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<Card> cards = cardRepository.findByUserId(userDetails.getId());
        return ResponseEntity.ok(cards);
    }

    @PostMapping("")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> addCard(@RequestBody Card card, @AuthenticationPrincipal UserDetailsImpl userDetails) {
        User user = userRepository.findById(userDetails.getId()).orElse(null);
        if (user == null)
            return ResponseEntity.badRequest().body("Usuario no encontrado");

        card.setUser(user);
        cardRepository.save(card);
        return ResponseEntity.ok("Tarjeta guardada correctamente");
    }
    
    @DeleteMapping("/{number}")
    public ResponseEntity<?> updateCard(@PathVariable String number, @RequestBody String entity) {
        cardRepository.deleteById(number);
        return ResponseEntity.ok("");
    }
    
}
