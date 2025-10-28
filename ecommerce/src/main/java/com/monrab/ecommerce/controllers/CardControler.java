package com.monrab.ecommerce.controllers;

import java.util.List;
import java.util.Map;

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
    public ResponseEntity<?> addCard(@RequestBody Map<String, String> payload, @AuthenticationPrincipal UserDetailsImpl userDetails) {
        System.out.println("ENTRO: " + payload.toString());
        User user = userRepository.findById(userDetails.getId()).orElse(null);
        if (user == null)
            return ResponseEntity.badRequest().body("Usuario no encontrado");

        String expMonth = payload.get("expMonth");
        String expYear = payload.get("expYear");
        String expirationDate = expMonth + "/" + expYear.substring(2);

        Card card = new Card();
        card.setNumber(payload.get("number"));
        card.setName(payload.get("name"));
        card.setCvv(payload.get("cvv"));
        card.setExpiration_date(expirationDate);
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
