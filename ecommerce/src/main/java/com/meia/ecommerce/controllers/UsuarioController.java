package com.meia.ecommerce.controllers;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.meia.ecommerce.dto.ProductoDto;
import com.meia.ecommerce.dto.UsuarioDto;
import com.meia.ecommerce.dto.UsuarioLoginDto;
import com.meia.ecommerce.models.usuarios.Usuario;
import com.meia.ecommerce.services.ProductoService;
import com.meia.ecommerce.services.UsuarioService;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;
    @Autowired
    private ProductoService productoService;

    @GetMapping("/list")
    public ResponseEntity<?> listUsuarios() {
        List<UsuarioDto> usuarios = usuarioService.listUsuarios();
        return ResponseEntity.ok(usuarios);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getUsuario(@PathVariable UUID id) {
        UsuarioDto usuario = usuarioService.getUsuario(id);
        if(usuario == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("El usuario con ID: " + id + " no existe.");
        }
        return ResponseEntity.ok(usuario);
    }

    @GetMapping("/{id}/productos")
    public ResponseEntity<?> getProductosUsuario(@PathVariable UUID id) {
        Usuario usuario = usuarioService.getUsuarioEntity(id);
        if(usuario == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("El usuario con ID: " + id + " no existe.");
        }
        List<ProductoDto> productos = productoService.listByUsuario(usuario);
        return ResponseEntity.ok(productos);
    }

    @GetMapping("/login")
    public ResponseEntity<?> login(@RequestBody UsuarioLoginDto dto) {
        try {
            UsuarioDto usuario = usuarioService.loginUsuario(dto);
            return ResponseEntity.ok(usuario);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }
}
