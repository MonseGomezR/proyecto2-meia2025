package com.meia.ecommerce.models.productos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.meia.ecommerce.models.usuarios.Usuario;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter

@NoArgsConstructor

@Entity
@Table(name = "detalle_rating", schema = "productos")
public class DetalleRating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Double valor;
    private String comentario;

    @ManyToOne
    @JoinColumn(name = "id_rating", nullable = false)
    @JsonIgnore
    private Rating rating;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    @JsonIgnore
    private Usuario usuario;
}
