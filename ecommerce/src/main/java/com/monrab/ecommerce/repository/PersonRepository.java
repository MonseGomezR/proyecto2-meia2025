package com.monrab.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.monrab.ecommerce.models.Person;

public interface PersonRepository extends JpaRepository<Person, String> {
    boolean existsByDpi(String dpi);
}
