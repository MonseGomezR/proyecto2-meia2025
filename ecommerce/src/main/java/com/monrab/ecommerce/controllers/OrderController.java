package com.monrab.ecommerce.controllers;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monrab.ecommerce.models.Logs;
import com.monrab.ecommerce.models.Order;
import com.monrab.ecommerce.models.OrderItem;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.repository.LogsRepository;
import com.monrab.ecommerce.repository.OrderItemRepository;
import com.monrab.ecommerce.repository.OrderRepository;
import com.monrab.ecommerce.repository.UserRepository;
import com.monrab.ecommerce.security.services.NotificationService;
import com.monrab.ecommerce.security.services.OrderService;
import com.monrab.ecommerce.security.services.UserDetailsImpl;

import jakarta.transaction.Transactional;

@RestController
@RequestMapping("/api/orders")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private NotificationService notificationService;
    @Autowired
    private OrderItemRepository orderItemRepository;
    @Autowired
    private LogsRepository logsRepository;
    @Autowired
    private UserRepository userRepository;

    @PostMapping("/create")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> createOrder(@AuthenticationPrincipal UserDetailsImpl userDetails,
            @RequestBody Map<String, String> payload) {
        String cardId = payload.get("cardId");
        Order order = orderService.createOrder(userDetails.getId(), cardId);
        if (order == null) {
            return ResponseEntity.badRequest().body("No se pudo crear la orden");
        }
        notificationService.createNotification("Nueva Orden Creada",
                "Se ha registrado su nueva orden con guía: " + order.getGuia(),
                userDetails.getId(),
                true);
        for (OrderItem item : order.getOrderItems()) {
            notificationService.createNotification("Producto Vendido",
                    "Su producto " + item.getProduct().getName() + " ha sido vendido en la orden con guía: "
                            + order.getGuia() + ". Tiene 5 dias para preparar el envío.",
                    item.getProduct().getOwner().getId(),
                    true);
        }
        return ResponseEntity.ok(order);
    }

    @GetMapping("/{guia}")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getOrderByGuia(@AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable String guia) {
        Optional<Order> order = orderRepository.findByGuiaAndUserId(guia, userDetails.getId());
        if (order == null) {
            return ResponseEntity.badRequest().body("Orden no encontrada");
        }
        return ResponseEntity.ok(order);
    }

    @GetMapping("")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getOrders(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<Order> orders = orderRepository.findByUserId(userDetails.getId());
        return ResponseEntity.ok(orders);
    }

    @GetMapping("/all")
    @PreAuthorize("hasRole('ADMIN') or hasRole('LOGISTIC')")
    public ResponseEntity<?> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        return ResponseEntity.ok(orders);
    }

    @PostMapping("/update-status/{orderId}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('LOGISTIC')")
    @Transactional
    public ResponseEntity<?> updateOrderStatus(@PathVariable UUID orderId, @AuthenticationPrincipal UserDetailsImpl userDetails) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (!orderOpt.isPresent()) {
            return ResponseEntity.badRequest().body("Orden no encontrada");
        }

        Order order = orderOpt.get();
        if (order.getStatus().getId() >= 3) {
            orderService.actualizarOrden(order);
        } else {
            orderService.actualizarEstado(order);
        }
        orderRepository.save(order);
        notificationService.createNotification("Orden " + order.getGuia() + " Actualizada",
                "El estado de la orden con guía: " + order.getGuia() + " ha sido actualizado a "
                        + order.getStatus().getName(),
                order.getUser().getId(),
                true);
                
        User user = userRepository.findById(userDetails.getId()).orElse(null);
        Logs log = new Logs();
        log.setAction("UPDATE ORDER STATUS");
        log.setDescription("Orden " + order.getGuia() + " actualizada a estado " + order.getStatus().getName());
        log.setUser(user);

        logsRepository.save(log);
        for (OrderItem item : order.getOrderItems()) {
            notificationService.createNotification("Producto Entregado",
                    "El envio de su producto " + item.getProduct().getName() + " de la orden " + order.getGuia()
                            + " completado. Ha generado una ganancia de Q" + item.getSubtotal(),
                    item.getProduct().getOwner().getId(),
                    true);
        }
        return ResponseEntity.ok(order);
    }

    @PostMapping("/update-order-item/{id}")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> updateOrderItemStatus(@PathVariable Long id) {
        boolean updated = orderService.updateItem(id);
        if (!updated) {
            return ResponseEntity.badRequest().body("No se pudo actualizar el estado del item de la orden");
        }

        OrderItem item = orderItemRepository.findById(id).orElse(null);

        UUID userId = item.getOrder().getUser().getId();
        User user = userRepository.findById(userId).orElse(null);

        Logs log = new Logs();
        log.setAction("UPDATE ORDER ITEM STATUS");
        log.setDescription("Producto de la orden " + item.getOrder().getGuia() + " actualizada a estado " + item.getStatus().getName());
        log.setUser(user);
        logsRepository.save(log);

        notificationService.createNotification("Estado de Producto Actualizado",
                "El producto " + item.getProduct().getName() + " de la orden " + item.getOrder().getGuia()
                        + " ha sido actualizado a " + item.getStatus().getName(),
                userId,
                true);

        return ResponseEntity.ok("Estado del item de la orden actualizado correctamente");
    }

    @GetMapping("/my-sales")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getMySales(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<OrderItem> ordersItems = orderService.getOrderItemsBySellerId(userDetails.getId());
        return ResponseEntity.ok(ordersItems);
    }

    @GetMapping("/ready-to-send")
    @PreAuthorize("hasRole('LOGISTIC')")
    public ResponseEntity<?> getReadyToSend() {
        List<Order> orders = orderService.getOrdersReadyForRoute();
        return ResponseEntity.ok(orders);
    }

    @GetMapping("/in-route")
    @PreAuthorize("hasRole('LOGISTIC')")
    public ResponseEntity<?> getInRoute() {
        List<Order> orders = orderService.getOrdersInRoute();
        return ResponseEntity.ok(orders);
    }

    @GetMapping("/completed")
    @PreAuthorize("hasRole('LOGISTIC')")
    public ResponseEntity<?> getCompleted() {
        
        List<Order> orders = orderService.getOrdersCompleted();
        return ResponseEntity.ok(orders);
    }
}
