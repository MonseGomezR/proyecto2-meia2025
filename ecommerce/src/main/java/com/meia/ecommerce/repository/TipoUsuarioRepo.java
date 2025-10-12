package com.meia.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.model.usuarios.TipoUsuario;

@Repository
public interface TipoUsuarioRepo extends JpaRepository<TipoUsuario, Integer>{

}
