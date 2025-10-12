package com.meia.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.meia.ecommerce.model.productos.Categoria;
import com.meia.ecommerce.service.CategoriaService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {

    @Autowired
    private CategoriaService categoriaService;

    @PostMapping("/create")
    public ResponseEntity<?> createCategoria(@RequestBody Categoria categoria){
        categoriaService.createCategoria(categoria);
        return ResponseEntity.status(HttpStatus.CREATED).body("Categoria creada exitosamente");
    }

    @GetMapping("/list")
    public ResponseEntity<?> listCategorias() {
        List<Categoria> categorias = categoriaService.listCategorias();
        return ResponseEntity.ok(categorias);
    }
    
}
