package com.meia.ecommerce.model.productos;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.meia.ecommerce.model.usuarios.Usuario;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter

@NoArgsConstructor

@Entity
@Table(name = "producto", schema = "productos")
public class Producto {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    private String nombre;
    private String descripcion;
    private Double precio;
    private Integer stock;
    private String estado;
    //private String imagenUrl;

    @ManyToOne
    @JoinColumn(name = "id_categoria")
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "id_usuario")
    @JsonIgnore
    private Usuario usuario;

    @OneToOne(mappedBy = "producto", fetch = FetchType.LAZY)
    @JsonIgnore
    private Rating rating;
}
