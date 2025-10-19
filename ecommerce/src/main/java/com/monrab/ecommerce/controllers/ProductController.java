package com.monrab.ecommerce.controllers;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monrab.ecommerce.models.Category;
import com.monrab.ecommerce.models.Product;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.payload.request.ProductRequest;
import com.monrab.ecommerce.repository.CategoryRepository;
import com.monrab.ecommerce.repository.ProductRepository;
import com.monrab.ecommerce.repository.UserRepository;
import com.monrab.ecommerce.security.services.UserDetailsImpl;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("/api/products")
@CrossOrigin(origins = "*", maxAge = 3600)
public class ProductController {
 
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/get")
    public ResponseEntity<?> getAllProducts() {
        List<Product> products = productRepository.findAll();
        return ResponseEntity.ok(products);
    }

    @GetMapping("/get/{id}")
    public ResponseEntity<?> getProduct(@PathVariable UUID id) {
        return productRepository.findById(id).map(ResponseEntity::ok)
        .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/my")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getProducts(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<Product> products = productRepository.findByOwnerId(userDetails.getId());
        return ResponseEntity.ok(products);
    }

    @PostMapping("/create")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> createProduct(@RequestBody ProductRequest request, @AuthenticationPrincipal UserDetailsImpl userDetails) {
        User user = userRepository.findById(userDetails.getId()).orElse(null);

        if (user == null)
            return ResponseEntity.badRequest().body("Usuario no encontrado");

        Set<Category> categories = new HashSet<>();
        if (request.getCategories() != null) {
            for (Integer id : request.getCategories()) {
                categoryRepository.findById(id).ifPresent(categories::add);
            }
        }else {
            categoryRepository.findById(6).ifPresent(categories::add);
        }

        Product product = new Product();
        product.setName(request.getName());
        product.setDescription(request.getDescription());
        product.setImage_url(request.getImage_url());
        product.setPrice(request.getPrice());
        product.setStock(request.getStock());
        product.setState(request.getState());
        product.setCategories(categories);
        product.setOwner(user);
        product.setCreated_at(LocalDateTime.now());

        productRepository.save(product);
        return ResponseEntity.ok("Product created successfully!");
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProduct(@PathVariable UUID id, @RequestBody ProductRequest entity) {
        return ResponseEntity.ok("AAA");
    }
}
