package com.monrab.ecommerce.controllers;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
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

public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private Cloudinary cloudinary;

    @GetMapping("")
    public ResponseEntity<?> getAllProducts() {
        List<Product> products = productRepository.findAll();
        return ResponseEntity.ok(products);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProduct(@PathVariable UUID id) {
        return productRepository.findById(id).map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/my-products")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getProducts(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<Product> products = productRepository.findByOwnerId(userDetails.getId());
        return ResponseEntity.ok(products);
    }

    @GetMapping("/categories")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getAllCategories() {
        return ResponseEntity.ok(categoryRepository.findAll());
    }

    @PostMapping("/create")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> createProduct(@RequestBody ProductRequest request,
            @AuthenticationPrincipal UserDetailsImpl userDetails) {
        User user = userRepository.findById(userDetails.getId()).orElse(null);

        if (user == null)
            return ResponseEntity.badRequest().body("Usuario no encontrado");

        Set<Category> categories = new HashSet<>();
        if (request.getCategories() != null) {
            for (Integer id : request.getCategories()) {
                categoryRepository.findById(id).ifPresent(categories::add);
            }
        } else {
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

    @SuppressWarnings("rawtypes")
    @PostMapping("/upload")
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file) {
        try {
            if (file.isEmpty()) {
                return ResponseEntity.badRequest().body(Map.of("error", "No file uploaded"));
            }

            // Subida segura usando el bean de Cloudinary
            Map uploadResult = cloudinary.uploader().upload(
                    file.getBytes(),
                    ObjectUtils.asMap(
                            "resource_type", "auto"
                    ));

            String url = uploadResult.get("secure_url").toString();
            return ResponseEntity.ok(Map.of("url", url));

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("error", "Upload failed", "details", e.getMessage()));
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProduct(@PathVariable UUID id, @RequestBody ProductRequest entity) {
        return ResponseEntity.ok("AAA");
    }
}
