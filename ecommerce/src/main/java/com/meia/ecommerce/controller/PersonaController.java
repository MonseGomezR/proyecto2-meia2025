package com.meia.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.meia.ecommerce.common.ApiResponse;
import com.meia.ecommerce.dto.UsuarioDto;
import com.meia.ecommerce.model.usuarios.Persona;
import com.meia.ecommerce.model.usuarios.TipoUsuario;
import com.meia.ecommerce.repository.TipoUsuarioRepo;
import com.meia.ecommerce.service.PersonaService;
import com.meia.ecommerce.service.UsuarioService;

@RestController
@RequestMapping("/persona")
public class PersonaController {
    @Autowired
    private PersonaService personaService;
    @Autowired
    private UsuarioService usuarioService;
    @Autowired
    private TipoUsuarioRepo tipoUsuarioRepo;

    @PostMapping("/register")
    public ResponseEntity<ApiResponse> register(@RequestBody Persona persona, @RequestBody UsuarioDto usuario) {
        personaService.createPersona(persona);
        TipoUsuario tipoUsuario = tipoUsuarioRepo.findById(usuario.getIdTipo()).get();
        usuarioService.createUsuario(usuario, tipoUsuario, persona);
        return new ResponseEntity<>(new ApiResponse(true, "Cliente creado exitosamente"), HttpStatus.CREATED);
    }

    @GetMapping("/list")
    public ResponseEntity<?> listUsuarios() {
        List<Persona> personas = personaService.listPersonas();
        return ResponseEntity.ok(personas);
    }

    @GetMapping("/{dpi}")
    public ResponseEntity<?> getPersona(@PathVariable String dpi) {
        Persona persona = personaService.getPersona(dpi);
        return ResponseEntity.ok(persona);
    }
    
}
