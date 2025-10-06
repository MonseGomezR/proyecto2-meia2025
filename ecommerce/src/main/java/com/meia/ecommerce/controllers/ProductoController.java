package com.meia.ecommerce.controllers;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.meia.ecommerce.models.productos.Producto;
import com.meia.ecommerce.models.usuarios.Usuario;
import com.meia.ecommerce.services.ProductoService;
import com.meia.ecommerce.services.UsuarioService;

@RestController
@RequestMapping("/producto")
public class ProductoController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private ProductoService productoService;

    @PostMapping("/create")
    public String createUsuario(@RequestBody Producto producto){
        productoService.createProducto(producto);
        return "Producto creado exitosamente";
    }

    @GetMapping("/list")
    public List<Producto> listProductos() {
        return productoService.listProductos();
    }

    @GetMapping("/usuario/{usuarioId}")
    public List<Producto> listByUsuario(@PathVariable UUID usuarioId) {
        Usuario usuario = usuarioService.getUsuario(usuarioId);
        return productoService.listByUsuario(usuario);
    }
}
