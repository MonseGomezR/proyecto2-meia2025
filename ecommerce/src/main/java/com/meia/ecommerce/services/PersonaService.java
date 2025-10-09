package com.meia.ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meia.ecommerce.models.usuarios.Persona;
import com.meia.ecommerce.repository.PersonaRepo;

@Service
public class PersonaService {

    @Autowired
    private PersonaRepo personaRepo;

    public void createPersona(Persona persona) {
        personaRepo.save(persona);
    }

    public List<Persona> listPersonas() {
        return personaRepo.findAll();
    }

    public Persona getPersona(String dpi) {
        return personaRepo.findById(dpi).orElseThrow(() -> new RuntimeException("Persona no encontrada"));
    }

}
