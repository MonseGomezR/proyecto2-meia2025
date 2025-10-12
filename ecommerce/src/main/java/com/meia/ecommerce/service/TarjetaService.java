package com.meia.ecommerce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meia.ecommerce.model.usuarios.Tarjeta;
import com.meia.ecommerce.model.usuarios.Usuario;
import com.meia.ecommerce.repository.TarjetaRepo;

@Service
public class TarjetaService {

    @Autowired
    private TarjetaRepo tarjetaRepo;

    public void createTarjeta(Tarjeta tarjeta){
        tarjetaRepo.save(tarjeta);
    }

    public List<Tarjeta> listTarjetas(){
        return tarjetaRepo.findAll();
    }

    public List<Tarjeta> listByUsuario(Usuario usuario) {
        return tarjetaRepo.findByUsuario(usuario);
    }
}
