package com.meia.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.meia.ecommerce.model.ventas.Estado;

@Repository
public interface EstadoProductoRepo extends JpaRepository<Estado, Integer>{

}
