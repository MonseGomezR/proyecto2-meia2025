package com.monrab.ecommerce.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.monrab.ecommerce.models.OrderItem;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    @Query("SELECT oi FROM OrderItem oi WHERE oi.product.owner.id = :id")
    List<OrderItem> findAllBySellerId(@Param("id") UUID id);

    @Query("""
                SELECT SUM(oi.subtotal)
                FROM OrderItem oi
                JOIN oi.product p
                WHERE p.owner.id = :userId
                AND oi.status.name = 'ENVIADO'
            """)
    Double calcularGananciaPorUsuario(@Param("userId") UUID userId);

}
