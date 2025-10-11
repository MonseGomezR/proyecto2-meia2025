package com.meia.ecommerce.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meia.ecommerce.dto.ProductoDto;
import com.meia.ecommerce.entities.productos.Categoria;
import com.meia.ecommerce.entities.productos.Producto;
import com.meia.ecommerce.entities.usuarios.Usuario;
import com.meia.ecommerce.repository.ProductoRepo;

@Service
public class ProductoService {

    @Autowired
    private ProductoRepo productoRepo;

    public void createProducto(ProductoDto productoDto, Categoria categoria, Usuario usuario) {
        Producto producto = new Producto();
        producto.setNombre(productoDto.getNombre());
        producto.setDescripcion(productoDto.getDescripcion());
        producto.setPrecio(productoDto.getPrecio());
        producto.setStock(productoDto.getStock());
        producto.setEstado(productoDto.getEstado());
        producto.setCategoria(categoria);
        producto.setUsuario(usuario);

        productoRepo.save(producto);
    }

    public List<ProductoDto> listProductos() {
        List<Producto> productos = productoRepo.findAll();
        List<ProductoDto> productoDtos = new ArrayList<>();
        for (Producto producto : productos) {
            productoDtos.add(getDto(producto));
        }
        return productoDtos;
    }

    public List<ProductoDto> listByUsuario(Usuario usuario) {
        List<Producto> productos = productoRepo.findByUsuario(usuario);
        List<ProductoDto> productoDtos = new ArrayList<>();

        for (Producto producto : productos) {
            productoDtos.add(getDto(producto));
        }

        return productoDtos;
    }

    public ProductoDto getDto(Producto producto) {
        ProductoDto productoDto = new ProductoDto();
        productoDto.setNombre(producto.getNombre());
        productoDto.setDescripcion(producto.getDescripcion());
        productoDto.setPrecio(producto.getPrecio());
        productoDto.setStock(producto.getStock());
        productoDto.setEstado(producto.getEstado());
        productoDto.setIdCategoria(producto.getCategoria().getId());
        productoDto.setIdUsuario(producto.getUsuario().getId());
        return productoDto;
    }

}
