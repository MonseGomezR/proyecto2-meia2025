package com.meia.ecommerce.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UsuarioRegisterDto {
    private @NotNull String usuario;
    private @NotNull String password;
    private @NotNull String idPersona;
    private @NotNull Integer idTipo;
}
