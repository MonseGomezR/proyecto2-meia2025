package com.monrab.ecommerce.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.monrab.ecommerce.models.Card;

public interface CardRepository extends JpaRepository<Card, String> {
    List<Card> findByUserId(UUID userId);
}