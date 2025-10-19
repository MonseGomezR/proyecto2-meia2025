package com.monrab.ecommerce.payload.response;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductResponse {
    private UUID id;
    private String name;
    private String description;
    private String imageUrl;
    private double price;
    private int stock;
    private String state;
    private String status;
    private LocalDateTime createdAt;
    private Set<String> categories;
}
