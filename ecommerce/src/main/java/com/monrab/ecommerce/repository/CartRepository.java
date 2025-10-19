package com.monrab.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.monrab.ecommerce.models.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer>{
}
