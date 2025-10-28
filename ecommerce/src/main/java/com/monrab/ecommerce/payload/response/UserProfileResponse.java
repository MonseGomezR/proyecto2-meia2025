package com.monrab.ecommerce.payload.response;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class UserProfileResponse {
    private UUID id;
    private String username;
    private String email;
    private String dpi;
    private String firstName;
    private String lastName;
    private String address;
    private String phone;
    private Double ganancias;
}
