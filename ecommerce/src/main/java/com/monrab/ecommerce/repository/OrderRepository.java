package com.monrab.ecommerce.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.monrab.ecommerce.models.Order;
import com.monrab.ecommerce.models.OrderStatus;

@Repository
public interface OrderRepository extends JpaRepository<Order, UUID> {
    Optional<Order> findByGuiaAndUserId(String guia, UUID userId);
    List<Order> findByUserId(UUID userId);
    List<Order> findByStatus(OrderStatus orderStatus);
}
