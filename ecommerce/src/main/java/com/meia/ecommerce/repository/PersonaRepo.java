package com.meia.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.models.usuarios.Persona;

@Repository
public interface PersonaRepo extends JpaRepository<Persona, String> {

}
