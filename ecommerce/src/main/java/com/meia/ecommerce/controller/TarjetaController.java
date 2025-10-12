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

import com.meia.ecommerce.model.usuarios.Tarjeta;
import com.meia.ecommerce.model.usuarios.Usuario;
import com.meia.ecommerce.repository.UsuarioRepo;
import com.meia.ecommerce.service.TarjetaService;

@RestController
@RequestMapping("/tarjeta")
public class TarjetaController {
    @Autowired
    private UsuarioRepo usuarioRepo;

    @Autowired
    private TarjetaService tarjetaService;

    @PostMapping("/create")
    public ResponseEntity<?> createTarjeta(@RequestBody Tarjeta tarjeta) {
        tarjetaService.createTarjeta(tarjeta);
        return ResponseEntity.ok("Tarjeta creada exitosamente");
    }

    @GetMapping("/list")
    public ResponseEntity<?> listTarjetas() {
        List<Tarjeta> tarjetas = tarjetaService.listTarjetas();
        return ResponseEntity.ok(tarjetas);
    }

    @GetMapping("/usuario/{id}")
    public ResponseEntity<?> listByUsuario(@PathVariable UUID id) {
        Optional<Usuario> usuario = usuarioRepo.findById(id);

        if (usuario.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("El usuario con ID: " + id + " no existe.");
        }

        List<Tarjeta> tarjetas = tarjetaService.listByUsuario(usuario.get());
        return ResponseEntity.ok(tarjetas);
    }
}
