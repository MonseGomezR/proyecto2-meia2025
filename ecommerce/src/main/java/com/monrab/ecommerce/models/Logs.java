package com.monrab.ecommerce.models;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor

@Entity
@Table(name = "logs", schema = "admin")
public class Logs {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "logs_id_seq")
    @SequenceGenerator(name = "logs_id_seq", sequenceName = "admin.logs_id_seq", allocationSize = 1)
    private Long id;

    private String action;
    private String description;
    private LocalDateTime created_at;

    @ManyToOne()
    @JoinColumn(name = "user_id")
    private User user;
}
