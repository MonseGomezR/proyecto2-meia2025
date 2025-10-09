package com.meia.ecommerce.common;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor

public class ApiResponse {
    private final boolean exito;
    private final String mensaje;

    public String getTimeStamp() {
        return LocalDateTime.now().toString();
    }
}
