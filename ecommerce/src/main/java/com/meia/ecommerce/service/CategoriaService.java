package com.meia.ecommerce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meia.ecommerce.model.productos.Categoria;
import com.meia.ecommerce.repository.CategoriaRepo;

@Service
public class CategoriaService {

    @Autowired
    private CategoriaRepo categoriaRepo;

    public void createCategoria(Categoria categoria){
        categoriaRepo.save(categoria);
    }

    public List<Categoria> listCategorias(){
        return categoriaRepo.findAll();
    }
}
