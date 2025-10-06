package com.meia.ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meia.ecommerce.models.productos.Producto;
import com.meia.ecommerce.models.usuarios.Usuario;
import com.meia.ecommerce.repository.ProductoRepo;

@Service
public class ProductoService {

    @Autowired
    private ProductoRepo productoRepo;

    public void createProducto(Producto producto) {
        productoRepo.save(producto);
    }

    public List<Producto> listProductos() {
        return productoRepo.findAll();
    }

    public List<Producto> listByUsuario(Usuario usuario) {
        return productoRepo.findByUsuario(usuario);
    }

}
