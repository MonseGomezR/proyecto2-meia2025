package com.monrab.ecommerce.security.services;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.monrab.ecommerce.models.Cart;
import com.monrab.ecommerce.models.CartItem;
import com.monrab.ecommerce.models.Order;
import com.monrab.ecommerce.models.OrderItem;
import com.monrab.ecommerce.models.OrderStatus;
import com.monrab.ecommerce.models.Payment;
import com.monrab.ecommerce.models.Product;
import com.monrab.ecommerce.models.User;
import com.monrab.ecommerce.repository.OrderItemRepository;
import com.monrab.ecommerce.repository.OrderRepository;
import com.monrab.ecommerce.repository.OrderStatusRepository;
import com.monrab.ecommerce.repository.ProductRepository;
import com.monrab.ecommerce.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderStatusRepository orderStatusRepository;
    @Autowired
    private OrderItemRepository orderItemRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProductRepository productRepository;

    @Transactional
    public Order createOrder(UUID idUsuario, String cardId) {
        System.out.println("Creando orden para usuario ID: " + idUsuario + " con tarjeta ID: " + cardId);
        User user = userRepository.findById(idUsuario)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        Cart cart = user.getCart();
        Set<CartItem> cartItems = cart.getItems();

        if (cartItems.isEmpty()) {
            throw new RuntimeException("El carrito está vacío");
        }

        double total = cart.getTotal();

        Order orden = new Order();
        orden.setUser(user);
        orden.setCreated_at(LocalDateTime.now());
        orden.setTotal(total);

        for (CartItem ci : cartItems) {
            Product producto = ci.getProduct();
            if (producto.getStock() < ci.getQuantity()) {
                throw new RuntimeException("No hay suficiente stock para el producto: " + producto.getName());
            }

            producto.setStock(producto.getStock() - ci.getQuantity());
            productRepository.save(producto);

            OrderItem oi = new OrderItem();
            oi.setProduct(ci.getProduct());
            oi.setCantidad(ci.getQuantity());
            oi.setSubtotal(ci.getSubtotal());
            oi.setStatus(orderStatusRepository.findById(1).get());
            orden.addItem(oi);
        }

        Payment payment = new Payment();
        payment.setTotal(total);
        payment.setCard_id(cardId);
        orden.setPayment(payment);

        orden.setStatus(orderStatusRepository.findById(1).get());

        Order savedOrder = orderRepository.save(orden);

        savedOrder.setGuia(generarGuia(savedOrder.getId()));
        return orderRepository.save(savedOrder);
    }

    private String generarGuia(UUID id) {
        return "GT" + id.toString().substring(0, 8).toUpperCase();
    }

    public void actualizarEstado(Order order) {
        boolean todosPendientes = true;
        boolean todosEntregados = true;

        for (OrderItem item : order.getOrderItems()) {
            switch (item.getStatus().getName()) {
                case "EN PROCESO":
                    todosPendientes = false;
                    todosEntregados = false;
                    break;
                case "ENVIADO":
                    todosPendientes = false;
                    break;
                case "PENDIENTE":
                    todosEntregados = false;
                    break;
            }
        }
        if (todosPendientes) {
            order.setStatus(orderStatusRepository.findByName("PENDIENTE").get());
        } else if (todosEntregados) {
            order.setStatus(orderStatusRepository.findByName("ENVIADO").get());
        } else {
            order.setStatus(orderStatusRepository.findByName("EN PROCESO").get());
        }
        orderRepository.save(order);
    }

    public void actualizarOrden(Order order) {
        int statusId = order.getStatus().getId();
        System.out.println("Estado actual de la orden ID " + order.getId() + ": " + order.getStatus().getName() + " (ID: " + statusId + ")");
        if (statusId < 5) {
            order.setStatus(orderStatusRepository.findById(statusId + 1).get());
        }
        if(order.getStatus().getName().equals("EN RUTA")) {
            order.setShip_date(LocalDateTime.now());
        }else if(order.getStatus().getName().equals("ENTREGADO")) {
            order.setDelivery_date(LocalDateTime.now());
            order.getOrderItems().forEach(item -> {
                User user = item.getProduct().getOwner();
                user.setGanancias(user.getGanancias() + item.getSubtotal());
                userRepository.save(user);
            });
            System.out.println("Orden ID " + order.getId() + " entregada en: " + order.getDelivery_date());
        }
        orderRepository.save(order);
    }

    public boolean updateItem(Long orderItemId) {
        Optional<OrderItem> item = orderItemRepository.findById(orderItemId);
        if (item == null) {
            return false;
        }

        switch (item.get().getStatus().getName()) {
            case "PENDIENTE":
                item.get().setStatus(orderStatusRepository.findByName("EN PROCESO").get());
                break;
            case "EN PROCESO":
                item.get().setStatus(orderStatusRepository.findByName("ENVIADO").get());
                break;
            default:
                return false;
        }

        orderItemRepository.save(item.get());
        actualizarEstado(item.get().getOrder());
        return true;
    }

    public List<OrderItem> getOrderItemsBySellerId(UUID id) {
        return orderItemRepository.findAllBySellerId(id);
    }

    public List<Order> getOrdersReadyForRoute() {
        OrderStatus orderStatus = orderStatusRepository.findById(3).orElse(null);
        return orderRepository.findByStatus(orderStatus);
    }

    public List<Order> getOrdersInRoute() {
        OrderStatus orderStatus = orderStatusRepository.findById(4).orElse(null);
        return orderRepository.findByStatus(orderStatus);
    }

    public List<Order> getOrdersCompleted() {
        OrderStatus orderStatus = orderStatusRepository.findById(5).orElse(null);
        return orderRepository.findByStatus(orderStatus);
    }

    public void penalizarVendedoresRetrasados() {
        List<Order> allOrders = orderRepository.findAll();

        for (Order order : allOrders) {
            long days = ChronoUnit.DAYS.between(order.getCreated_at().toLocalDate(), LocalDate.now());

            if (days > 5) {
                for (OrderItem item : order.getOrderItems()) {
                    String estado = item.getStatus().getName();
                    if (!estado.equals("ENVIADO") && !estado.equals("ENTREGADO")) {
                        User seller = item.getProduct().getOwner();
                        System.out.println("Penalizando vendedor: " + seller.getUsername());
                    }
                }
            }
        }
    }

    public Double calcularGanancia(UUID userId) {
        Double ganancia = orderItemRepository.calcularGananciaPorUsuario(userId);
        return ganancia != null ? ganancia : 0.0;
    }
}
