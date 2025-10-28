package com.monrab.ecommerce.security.services;

import com.monrab.ecommerce.repository.ReportRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class ReportService {

    private final ReportRepository reportRepository;

    public ReportService(ReportRepository reportRepository) {
        this.reportRepository = reportRepository;
    }

    public List<Map<String, Object>> topProductosMasVendidos(LocalDateTime start, LocalDateTime end) {
        return reportRepository.topProductosMasVendidos(start, end);
    }

    public List<Map<String, Object>> topClientesPorGanancia(LocalDateTime start, LocalDateTime end) {
        return reportRepository.topClientesPorGanancia(start, end);
    }

    public List<Map<String, Object>> topClientesQueMasHanVendido(LocalDateTime start, LocalDateTime end) {
        return reportRepository.topClientesQueMasHanVendido(start, end);
    }

    public List<Map<String, Object>> topClientesConMasPedidos(LocalDateTime start, LocalDateTime end) {
        return reportRepository.topClientesConMasPedidos(start, end);
    }

    public List<Map<String, Object>> topClientesConMasProductosActivos() {
        return reportRepository.topClientesConMasProductosActivos();
    }
}
