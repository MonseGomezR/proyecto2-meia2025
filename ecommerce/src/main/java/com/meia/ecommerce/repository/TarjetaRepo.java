package com.meia.ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.models.usuarios.Tarjeta;
import com.meia.ecommerce.models.usuarios.Usuario;

@Repository
public interface TarjetaRepo extends JpaRepository<Tarjeta, String>{
    List<Tarjeta> findByUsuario(Usuario usuario);
}
