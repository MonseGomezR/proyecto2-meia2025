package com.meia.ecommerce.dto;

import java.util.UUID;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProductoDto {

    private UUID id;
    private @NotNull String nombre;
    private @NotNull String descripcion;
    private @NotNull Double precio;
    private @NotNull Integer stock;
    private @NotNull String estado;
    private @NotNull Integer idCategoria;
    private @NotNull UUID idUsuario;

}
