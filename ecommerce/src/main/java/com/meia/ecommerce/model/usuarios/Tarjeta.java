package com.meia.ecommerce.model.usuarios;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
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
@Table(name = "tarjeta", schema = "usuarios")
public class Tarjeta {

    @Id
    @GeneratedValue
    private String numero;

    private String nombre;
    private String fechaVencimiento;
    private String cvv;

    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;
}
