package com.meia.ecommerce.controller;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.meia.ecommerce.dto.ProductoDto;
import com.meia.ecommerce.model.productos.Categoria;
import com.meia.ecommerce.model.usuarios.Usuario;
import com.meia.ecommerce.repository.CategoriaRepo;
import com.meia.ecommerce.repository.UsuarioRepo;
import com.meia.ecommerce.service.ProductoService;

@RestController
@RequestMapping("/producto")
public class ProductoController {

    @Autowired
    private UsuarioRepo usuarioRepo;

    @Autowired
    private ProductoService productoService;
    @Autowired
    private CategoriaRepo categoriaRepo;

    @PostMapping("/add")
    public ResponseEntity<?> createUsuario(@RequestBody ProductoDto productoDto) {
        Optional<Categoria> categoria = categoriaRepo.findById(productoDto.getIdCategoria());
        if (!categoria.isPresent()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("La categoria indicada no existe.");
        }

        Optional<Usuario> usuario = usuarioRepo.findById(productoDto.getIdUsuario());
        if (!usuario.isPresent()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("El usuario con ID: " + productoDto.getIdUsuario() + " no existe.");
        }

        productoService.createProducto(productoDto, categoria.get(), usuario.get());
        return ResponseEntity.status(HttpStatus.CREATED).body("El producto se ha agregado");
    }

    @GetMapping("/list")
    public ResponseEntity<List<ProductoDto>> listProductos() {
        List<ProductoDto> productos = productoService.listProductos();
        return ResponseEntity.ok(productos);
    }

    @GetMapping("/usuario/{id}")
    public ResponseEntity<?> listByUsuario(@PathVariable UUID id) {
        Optional<Usuario> usuario = usuarioRepo.findById(id);

        if (usuario.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("El usuario con ID: " + id + " no existe.");
        }

        List<ProductoDto> productos = productoService.listByUsuario(usuario.get());
        return ResponseEntity.ok(productos);
    }

}
