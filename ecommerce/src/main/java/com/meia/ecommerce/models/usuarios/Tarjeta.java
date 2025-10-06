package com.meia.ecommerce.models.usuarios;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "tarjeta", schema = "usuarios")
public class Tarjeta {

    @Id
    @GeneratedValue
    private String numero;

    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "fecha_vencimiento", nullable = false)
    private String fechaVencimiento;

    @Column(name = "cvv", nullable = false)
    private String cvv;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;
}
