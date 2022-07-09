package com.pgm.board.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.pgm.board.model.Coffee;

public interface CoffeeRepository extends JpaRepository<Coffee, Long> {

    Page<Coffee> findByType(String string, Pageable pageable);

}
