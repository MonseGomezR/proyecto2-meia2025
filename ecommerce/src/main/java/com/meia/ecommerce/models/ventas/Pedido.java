package com.meia.ecommerce.models.ventas;

import java.sql.Date;
import java.util.UUID;

import com.meia.ecommerce.models.usuarios.Usuario;

import jakarta.persistence.Entity;
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
@Table(name = "pedido", schema = "ventas")
public class Pedido {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    private Double total;
    private Date fechaEnvio;
    private Date fechaEntrega;
    
    @ManyToOne
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "id_estado")
    private Estado estado;

    @OneToOne
    @JoinColumn(name = "id_pago")
    private Pago pago;
}
