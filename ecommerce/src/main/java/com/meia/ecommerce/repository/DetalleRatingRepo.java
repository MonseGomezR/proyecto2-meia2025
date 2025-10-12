package com.meia.ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.meia.ecommerce.model.productos.DetalleRating;
import com.meia.ecommerce.model.productos.Rating;
import com.meia.ecommerce.model.usuarios.Usuario;

public interface DetalleRatingRepo extends JpaRepository<DetalleRating, Integer>{
    List<DetalleRating> findByRating(Rating rating);
    List<DetalleRating> findByUsuario(Usuario usuario);
}
