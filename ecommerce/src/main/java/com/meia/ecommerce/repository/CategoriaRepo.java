package com.meia.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.models.productos.Categoria;

@Repository
public interface CategoriaRepo extends JpaRepository<Categoria, Integer> {}
