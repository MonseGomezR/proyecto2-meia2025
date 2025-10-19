package com.monrab.ecommerce.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.monrab.ecommerce.models.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
