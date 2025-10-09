package com.meia.ecommerce.dto;

import java.util.UUID;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UsuarioDto {
    private UUID id;

    private @NotNull String usuario;
    private @NotNull Integer idTipo;
    private @NotNull String idPersona;
}
