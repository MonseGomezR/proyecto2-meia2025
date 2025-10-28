package com.monrab.ecommerce.models;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

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
@Table(name = "product", schema = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @NotBlank
    @Size(max = 100)
    private String name;
    
    private String description;
    private String image_url;

    @NotBlank
    private double price;

    @NotBlank
    private int stock;

    @Enumerated(EnumType.STRING)
    private EProductState state; // NEW, USED

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "product_category", schema = "products", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
    private Set<Category> categories = new HashSet<>();

    @Enumerated(EnumType.STRING)
    private EProductStatus status = EProductStatus.WAITING; // WAITING, APPROVED, REJECTED

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumn(name = "user_id")
    private User owner;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonIgnore
    @JoinColumn(name = "review_id")
    private Review review;

    private LocalDateTime created_at;
}
