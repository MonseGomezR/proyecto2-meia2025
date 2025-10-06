package com.meia.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.meia.ecommerce.models.productos.Categoria;
import com.meia.ecommerce.services.CategoriaService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {

    @Autowired
    private CategoriaService categoriaService;

    @PostMapping("/create")
    public String createCategoria(@RequestBody Categoria categoria){
        categoriaService.createCategoria(categoria);
        return "Categoria creada exitosamente";
    }

    @GetMapping("/list")
    public List<Categoria> listCategorias() {
        return categoriaService.listCategorias();
    }
    
}
