package com.monrab.ecommerce.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor

@Entity
@Table(name = "person", schema = "users")
public class Person {

    @Id
    private String dpi;

    @NotBlank
    @Size(max = 100)
    private String first_name;

    @NotBlank
    @Size(max = 100)
    private String last_name;

    @NotBlank
    @Size(max = 8)
    private String phone;

    @NotBlank
    @Size(max = 200)
    private String address;

}
