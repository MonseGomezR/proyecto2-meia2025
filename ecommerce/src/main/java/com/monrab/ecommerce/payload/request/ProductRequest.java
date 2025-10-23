package com.monrab.ecommerce.payload.request;

import java.util.Set;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductRequest {
    private String name;
    private String description;
    private String image_url;
    private double price;
    private int stock;
    private String state; // NEW / USED
    private String status;
    private Set<Integer> categories;
}
