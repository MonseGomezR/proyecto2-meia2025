package com.monrab.ecommerce.controllers;

import java.util.Optional;

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

@CrossOrigin(origins = "*", maxAge = 3600)
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
    public ResponseEntity<?> addProduct(@RequestBody AddProductRequest addProductRequest, @AuthenticationPrincipal UserDetailsImpl userDetails) {
        User user = userRepository.findById(userDetails.getId()).orElse(null);
        Cart cart = user.getCart();

        Product product = productRepository.findById(addProductRequest.getId()).orElseThrow(() -> new RuntimeException("Producto no encontrado"));

        Optional<CartItem> existingItem = cart.getItems().stream()
                .filter(i -> i.getProduct().getId().equals(product.getId()))
                .findFirst();
        if (existingItem.isPresent()) {
            CartItem item = existingItem.get();
            item.setQuantity(item.getQuantity() + addProductRequest.getQuantity());
            item.updateSubtotal();
        } else {
            CartItem item = new CartItem();
            item.setProduct(product);
            item.setQuantity(addProductRequest.getQuantity());
            item.updateSubtotal();
            cart.addItem(item);
        }

        cart.recalculateTotal();
        cartRepository.save(cart);
        return ResponseEntity.ok("Producto agregado");
    }

    @DeleteMapping("/remove/{itemId}")
    public ResponseEntity<?> removeItem(@PathVariable Integer itemId) {
        CartItem item = cartItemRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("Item no encontrado"));
        Cart cart = item.getCart();
        cartItemRepository.delete(item);
        cart.recalculateTotal();
        cartRepository.save(cart);
        return ResponseEntity.ok("Producto eliminado del carrito");
    }

}
