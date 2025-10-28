package com.monrab.ecommerce.controllers;

import com.monrab.ecommerce.security.services.ReportService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/reports")
public class ReportController {

    private final ReportService reportService;

    public ReportController(ReportService reportService) {
        this.reportService = reportService;
    }

    @GetMapping("/top-productos")
    public List<Map<String, Object>> topProductosMasVendidos(
            @RequestParam("start") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime start,
            @RequestParam("end") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime end) {
        return reportService.topProductosMasVendidos(start, end);
    }

    @GetMapping("/top-clientes-ganancia")
    public List<Map<String, Object>> topClientesPorGanancia(
            @RequestParam("start") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime start,
            @RequestParam("end") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime end) {
        return reportService.topClientesPorGanancia(start, end);
    }

    @GetMapping("/top-clientes-ventas")
    public List<Map<String, Object>> topClientesQueMasHanVendido(
            @RequestParam("start") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime start,
            @RequestParam("end") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime end) {
        return reportService.topClientesQueMasHanVendido(start, end);
    }

    @GetMapping("/top-clientes-pedidos")
    public List<Map<String, Object>> topClientesConMasPedidos(
            @RequestParam("start") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime start,
            @RequestParam("end") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime end) {
        return reportService.topClientesConMasPedidos(start, end);
    }

    @GetMapping("/top-clientes-productos")
    public List<Map<String, Object>> topClientesConMasProductosActivos() {
        return reportService.topClientesConMasProductosActivos();
    }
}
