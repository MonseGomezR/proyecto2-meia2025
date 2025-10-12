package com.meia.ecommerce.service;


import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meia.ecommerce.model.productos.DetalleRating;
import com.meia.ecommerce.model.productos.Producto;
import com.meia.ecommerce.model.productos.Rating;
import com.meia.ecommerce.model.usuarios.Usuario;
import com.meia.ecommerce.repository.DetalleRatingRepo;
import com.meia.ecommerce.repository.ProductoRepo;
import com.meia.ecommerce.repository.RatingRepo;
import com.meia.ecommerce.repository.UsuarioRepo;

import jakarta.persistence.EntityNotFoundException;

@Service
public class RatingService {

    @Autowired
    private RatingRepo ratingRepo;
    @Autowired
    private DetalleRatingRepo detalleRatingRepo;
    @Autowired
    private ProductoRepo productoRepo;
    @Autowired
    private UsuarioRepo usuarioRepo;

    public void createRating(Rating rating) {
        ratingRepo.save(rating);
    }

    public void createDetalle(DetalleRating detalleRating) {
        detalleRatingRepo.save(detalleRating);
    }

    public List<DetalleRating> findDetalleByProducto(UUID id) {
        Rating rating = findByProducto(id);
        return detalleRatingRepo.findByRating(rating);
    }

    public List<DetalleRating> findDetalleByUsuario(UUID id) {
        Usuario usuario = usuarioRepo.findById(id).orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));
        return detalleRatingRepo.findByUsuario(usuario);
    }

    public Rating findByProducto(UUID id) {
        Producto producto = productoRepo.findById(id).orElseThrow(() -> new EntityNotFoundException("Producto no encontrado"));
        return ratingRepo.findByProducto(producto);
    }
}
