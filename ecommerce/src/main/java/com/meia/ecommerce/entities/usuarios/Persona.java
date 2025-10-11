package com.meia.ecommerce.entities.usuarios;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter

@NoArgsConstructor

@Entity
@Table(name = "persona", schema = "usuarios")
public class Persona {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String dpi;

    private String nombre;
    private String direccion;
    private String correo;
    private Double ganancias;

    @OneToOne(mappedBy = "persona", fetch = FetchType.LAZY) 
    @JsonIgnore
    private Usuario usuario;
}
