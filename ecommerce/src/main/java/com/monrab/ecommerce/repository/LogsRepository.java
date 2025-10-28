package com.monrab.ecommerce.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.monrab.ecommerce.models.Logs;

@Repository
public interface LogsRepository extends JpaRepository<Logs, Long> {
    List<Logs> findByUserId(UUID userId);
}
