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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monrab.ecommerce.models.Category;
import com.monrab.ecommerce.models.EProductState;
import com.monrab.ecommerce.models.EProductStatus;
import com.monrab.ecommerce.models.Logs;
import com.monrab.ecommerce.models.Product;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.payload.request.ProductRequest;
import com.monrab.ecommerce.repository.CategoryRepository;
import com.monrab.ecommerce.repository.LogsRepository;
import com.monrab.ecommerce.repository.ProductRepository;
import com.monrab.ecommerce.repository.UserRepository;
import com.monrab.ecommerce.security.services.NotificationService;
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
    private NotificationService notificationService;
    @Autowired
    private LogsRepository logsRepository;

    @GetMapping("")
    public ResponseEntity<?> getApprovedProducts() {
        List<Product> products = productRepository.findByStatus(EProductStatus.APPROVED);
        return ResponseEntity.ok(products);
    }

    @GetMapping("/all")
    public ResponseEntity<?> getAllProducts() {
        List<Product> products = productRepository.findAll();
        return ResponseEntity.ok(products);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProduct(@PathVariable UUID id) {
        return productRepository.findById(id).map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/categories")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getAllCategories() {
        return ResponseEntity.ok(categoryRepository.findAll());
    }
    
    @GetMapping("/my-products")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getProducts(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<Product> products = productRepository.findByOwnerId(userDetails.getId());
        return ResponseEntity.ok(products);
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
        product.setState(EProductState.valueOf(request.getState()));
        product.setStatus(EProductStatus.valueOf(request.getStatus()));
        product.setCategories(categories);
        product.setOwner(user);
        product.setCreated_at(LocalDateTime.now());

        productRepository.save(product);
        return ResponseEntity.ok("Product created successfully!");
    }

    @GetMapping("/waiting")
    @PreAuthorize("hasRole('MODERATOR') or hasRole('ADMIN')")
    public ResponseEntity<?> getWaiting() {
        List<Product> products = productRepository.findByStatus(EProductStatus.WAITING);
        return ResponseEntity.ok(products);
    }

    @PutMapping("/{id}/approve")
    @PreAuthorize("hasRole('MODERATOR') or hasRole('ADMIN')")
    public ResponseEntity<?> approvedProduct(@PathVariable UUID id,
            @AuthenticationPrincipal UserDetailsImpl userDetails) {
        Product product = productRepository.findById(id).orElse(null);
        product.setStatus(EProductStatus.APPROVED);
        productRepository.save(product);

        notificationService.createNotification("Producto Aprovado",
                "Tu producto " + product.getName() + " ha sido aprovado.", product.getOwner().getId(), true);

        User user = userRepository.findById(userDetails.getId()).orElse(null);
        Logs log = new Logs();
        log.setAction("PRODUCT APPROVED");
        log.setDescription("Producto con ID: " + product.getId() + " aprovado");
        log.setUser(user);
        logsRepository.save(log);

        return ResponseEntity.ok("Producto aprobado");
    }

    @PutMapping("/{id}/reject")
    @PreAuthorize("hasRole('MODERATOR') or hasRole('ADMIN')")
    public ResponseEntity<?> rejectedProduct(@PathVariable UUID id,
            @AuthenticationPrincipal UserDetailsImpl userDetails) {
        Product product = productRepository.findById(id).orElse(null);
        product.setStatus(EProductStatus.REJECTED);
        productRepository.save(product);
        notificationService.createNotification("Producto Rechazado",
                "Tu producto " + product.getName() + " ha sido rechazado.", product.getOwner().getId(), true);

        User user = userRepository.findById(userDetails.getId()).orElse(null);
        Logs log = new Logs();
        log.setAction("PRODUCT APPROVED");
        log.setDescription("Producto con ID: " + product.getId() + " aprovado");
        log.setUser(user);
        logsRepository.save(log);

        return ResponseEntity.ok("Producto rechazado");
    }
}
