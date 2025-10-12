package com.meia.ecommerce.model.ventas;

import com.meia.ecommerce.model.usuarios.Tarjeta;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter

@NoArgsConstructor

@Entity
@Table(name = "pago", schema = "ventas")
public class Pago {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Double cantidad;

    @Column(name = "parte_empresa")
    private Double parteEmpresa;

    @Column(name = "parte_usuario")
    private Double parteUsuario;

    @OneToOne
    @JoinColumn(name = "id_tarjeta")
    private Tarjeta tarjeta;
}
