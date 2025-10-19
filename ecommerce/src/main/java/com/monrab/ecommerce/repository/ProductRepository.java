package com.monrab.ecommerce.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.monrab.ecommerce.models.Product;

public interface ProductRepository extends JpaRepository<Product, UUID>{
    List<Product> findByOwnerId(UUID owner);
}
