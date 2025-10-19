package com.monrab.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.monrab.ecommerce.models.CartItem;

public interface CartItemRepository extends JpaRepository<CartItem, Integer>{
}
