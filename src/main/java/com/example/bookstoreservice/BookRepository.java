package com.example.bookstoreservice;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<Books, Long> {
    // Spring Data JPA automatically creates CRUD methods for you!
}