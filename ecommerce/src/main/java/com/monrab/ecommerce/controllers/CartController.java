package com.monrab.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import com.monrab.ecommerce.models.Cart;
import com.monrab.ecommerce.models.CartItem;
import com.monrab.ecommerce.models.Product;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.payload.request.AddProductRequest;
import com.monrab.ecommerce.repository.CartItemRepository;
import com.monrab.ecommerce.repository.CartRepository;
import com.monrab.ecommerce.repository.ProductRepository;
import com.monrab.ecommerce.repository.UserRepository;
import com.monrab.ecommerce.security.services.UserDetailsImpl;

import jakarta.transaction.Transactional;

@RestController
@RequestMapping("/api/cart")
public class CartController {
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private CartItemRepository cartItemRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getMyCart(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        User user = userRepository.findById(userDetails.getId()).orElse(null);
        return ResponseEntity.ok(user.getCart());
    }

    @PostMapping("/add")
    @PreAuthorize("hasRole('USER')")
    @Transactional
    public ResponseEntity<?> addProduct(@RequestBody AddProductRequest addProductRequest,
            @AuthenticationPrincipal UserDetailsImpl userDetails) {

        User user = userRepository.findById(userDetails.getId())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        Cart cart = user.getCart();

        Product product = productRepository.findById(addProductRequest.getId())
                .orElseThrow(() -> new RuntimeException("Producto no encontrado"));

        CartItem item = cart.getItems().stream()
                .filter(i -> i.getProduct().getId().equals(product.getId()))
                .findFirst()
                .orElse(null);

        if (item != null) {
            item.setQuantity(item.getQuantity() + addProductRequest.getQuantity());
            item.updateSubtotal();
        } else {
            item = new CartItem();
            item.setProduct(product);
            item.setQuantity(addProductRequest.getQuantity());
            item.updateSubtotal();

            cart.addItem(item);
        }

        cart.recalculateTotal();
        cartRepository.save(cart);

        return ResponseEntity.ok("Producto agregado al carrito");
    }

    @DeleteMapping("/remove/{itemId}")
    @PreAuthorize("hasRole('USER')")
    @Transactional
    public ResponseEntity<?> removeItem(@PathVariable Integer itemId) {
        CartItem item = cartItemRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("Item no encontrado"));

        Cart cart = item.getCart();
        cart.removeItem(item);

        cartRepository.save(cart);

        return ResponseEntity.ok("Producto eliminado del carrito");
    }

}
