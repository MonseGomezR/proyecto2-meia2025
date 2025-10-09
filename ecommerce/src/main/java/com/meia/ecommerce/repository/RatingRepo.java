package com.meia.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.models.productos.Producto;
import com.meia.ecommerce.models.productos.Rating;

@Repository
public interface RatingRepo extends JpaRepository<Rating, Integer> {
    Rating findByProducto(Producto producto);
}
