package com.monrab.ecommerce.payload.request;

import java.util.Set;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SignupRequest {
    @NotBlank
    @Size(min = 3, max = 20)
    private String username;

    @NotBlank
    @Size(max = 50)
    @Email
    private String email;

    @NotBlank
    @Size(min = 6, max = 40)
    private String password;

    @NotBlank
    @Size(min= 13)
    private String dpi;

    @NotBlank
    @Size(min= 6, max = 100)
    private String firstName;

    @NotBlank
    @Size(min= 6, max = 100)
    private String lastName;

    @NotBlank
    @Size(min= 8)
    private String phone;

    @NotBlank
    @Size(max = 200)
    private String address;

    private Set<String> role;
}