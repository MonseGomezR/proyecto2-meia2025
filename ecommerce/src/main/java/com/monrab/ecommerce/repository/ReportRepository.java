package com.monrab.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.monrab.ecommerce.models.OrderItem;

import java.time.LocalDateTime;
import java.util.*;

@Repository
public interface ReportRepository extends JpaRepository<OrderItem, Long> {

    @Query("""
        SELECT new map(
            p.id AS productId,
            p.name AS name,
            SUM(oi.cantidad) AS totalSold
        )
        FROM OrderItem oi
        JOIN oi.product p
        JOIN oi.order o
        WHERE o.created_at BETWEEN :startDate AND :endDate
        GROUP BY p.id, p.name
        ORDER BY SUM(oi.cantidad) DESC
    """)
    List<Map<String, Object>> topProductosMasVendidos(
        @Param("startDate") LocalDateTime startDate,
        @Param("endDate") LocalDateTime endDate
    );

    @Query("""
        SELECT new map(
            u.id AS clientId,
            CONCAT(u.person.first_name, ' ', u.person.last_name) AS name,
            SUM(o.total) AS totalProfit
        )
        FROM Order o
        JOIN o.user u
        WHERE o.created_at BETWEEN :startDate AND :endDate
        GROUP BY u.id, u.person.first_name, u.person.last_name
        ORDER BY SUM(o.total) DESC
    """)
    List<Map<String, Object>> topClientesPorGanancia(
        @Param("startDate") LocalDateTime startDate,
        @Param("endDate") LocalDateTime endDate
    );

    @Query("""
        SELECT new map(
            p.owner.id AS clientId,
            CONCAT(p.owner.person.first_name, ' ', p.owner.person.last_name) AS name,
            oi.subtotal
        )
        FROM OrderItem oi
        JOIN oi.product p
        JOIN oi.order o
        WHERE o.created_at BETWEEN :startDate AND :endDate
        GROUP BY p.owner.id, p.owner.person.first_name, p.owner.person.last_name
        ORDER BY oi.subtotal DESC
    """)
    List<Map<String, Object>> topClientesQueMasHanVendido(
        @Param("startDate") LocalDateTime startDate,
        @Param("endDate") LocalDateTime endDate
    );

    @Query("""
        SELECT new map(
            u.id AS clientId,
            CONCAT(u.person.first_name, ' ', u.person.last_name) AS name,
            COUNT(o.id) AS totalOrders
        )
        FROM Order o
        JOIN o.user u
        WHERE o.created_at BETWEEN :startDate AND :endDate
        GROUP BY u.id, u.person.first_name, u.person.last_name
        ORDER BY COUNT(o.id) DESC
    """)
    List<Map<String, Object>> topClientesConMasPedidos(
        @Param("startDate") LocalDateTime startDate,
        @Param("endDate") LocalDateTime endDate
    );

    @Query("""
        SELECT new map(
            u.id AS clientId,
            CONCAT(u.person.first_name, ' ', u.person.last_name) AS name,
            COUNT(p.id) AS totalProducts
        )
        FROM Product p
        JOIN p.owner u
        WHERE p.status = APPROVED
        GROUP BY u.id, u.person.first_name, u.person.last_name
        ORDER BY COUNT(p.id) DESC
    """)
    List<Map<String, Object>> topClientesConMasProductosActivos();
}
