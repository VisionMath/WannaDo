package com.pgm.board.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.pgm.board.model.Coffee;
import com.pgm.board.repository.CoffeeRepository;

@Service
public class CoffeeServiceImpl implements CoffeeService {
    @Autowired
    private CoffeeRepository coffeeRepository;

    @PersistenceContext
    EntityManager em;

    @Override
    public List<Coffee> coffeeList() {
        // TODO Auto-generated method stub
        return coffeeRepository.findAll();
    }

    @Override
    public Page<Coffee> findAll(Pageable pageable) {
        // TODO Auto-generated method stub
        return coffeeRepository.findAll(pageable);
    }

    @Transactional
    @Override
    public Coffee findById(Long id) {
        // TODO Auto-generated method stub
        Coffee coffee = coffeeRepository.findById(id).get();
//		coffee.setHitcount(coffee.getHitcount()+1);
        return coffee;
    }

    @Override
    public Long count() {
        // TODO Auto-generated method stub
        return coffeeRepository.count();
    }

    @Override
    public Page<Coffee> findByType(String string, Pageable pageable) {
        // TODO Auto-generated method stub
        return coffeeRepository.findByType(string, pageable);
    }

    @Override
    public List<Coffee> findByTaste(String string) {
	// TODO Auto-generated method stub
	return coffeeRepository.findByTasteContaining(string);
    }

}
