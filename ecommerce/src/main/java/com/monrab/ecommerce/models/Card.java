package com.monrab.ecommerce.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor

@Entity
@Table(name = "card", schema = "users")
public class Card {
    @Id
    @Size(max = 16)
    private String number;

    @NotBlank
    @Size(max = 3)
    private String cvv;

    @NotBlank
    @Size(max = 5)
    private String expiration_date;
    
    @NotBlank
    @Size(max = 100)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumn(name = "user_id")
    private User user;
}
