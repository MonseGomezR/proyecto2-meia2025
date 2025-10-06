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

import com.meia.ecommerce.models.usuarios.Usuario;
import com.meia.ecommerce.services.UsuarioService;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/create")
    public String createUsuario(@RequestBody Usuario usuario){
        usuarioService.createUsuario(usuario);
        return "Usuario creado exitosamente";
    }

    @GetMapping("/list")
    public List<Usuario> listUsuarios() {
        return usuarioService.listUsuarios();
    }

    @GetMapping("/{id}")
    public Usuario getUsuario(@PathVariable UUID id) {
        return usuarioService.getUsuario(id);
    }
}
