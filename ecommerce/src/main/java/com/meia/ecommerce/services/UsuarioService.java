package com.meia.ecommerce.services;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meia.ecommerce.models.usuarios.Usuario;
import com.meia.ecommerce.repository.UsuarioRepo;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepo usuarioRepo;

    public void createUsuario(Usuario usuario) {
        usuarioRepo.save(usuario);
    }

    public List<Usuario> listUsuarios() {
        return usuarioRepo.findAll();
    }
    
    public Usuario getUsuario(UUID id) {
        return usuarioRepo.findById(id).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    }
}
