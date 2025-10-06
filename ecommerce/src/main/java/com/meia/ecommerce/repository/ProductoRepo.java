package com.meia.ecommerce.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.models.productos.Producto;
import com.meia.ecommerce.models.usuarios.Usuario;

@Repository
public interface ProductoRepo extends JpaRepository<Producto, UUID> {
    List<Producto> findByUsuario(Usuario usuario);
}
