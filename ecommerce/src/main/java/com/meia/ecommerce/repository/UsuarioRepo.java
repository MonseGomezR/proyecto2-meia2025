package com.meia.ecommerce.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.model.usuarios.Usuario;

@Repository
public interface UsuarioRepo extends JpaRepository<Usuario, UUID>{
    Usuario findByUsuario(String usuario);
}
