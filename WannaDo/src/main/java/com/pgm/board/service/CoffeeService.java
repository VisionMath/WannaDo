package com.pgm.board.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.pgm.board.model.Coffee;

public interface CoffeeService {

	public List<Coffee> coffeeList();

	public Coffee findById(Long id);

	public Long count();

	public Page<Coffee> findAll(Pageable pageable);

	public Page<Coffee> findByType(String string, Pageable pageable);

}
