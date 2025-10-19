package com.monrab.ecommerce.payload.request;

import java.util.Set;

import com.monrab.ecommerce.models.EProductState;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductRequest {
    private String name;
    private String description;
    private String image_url;
    private double price;
    private int stock;
    private EProductState state;
    private Set<Integer> categories;
}
