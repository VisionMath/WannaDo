package com.pgm.board.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.pgm.board.model.OrderVO;

public interface OrderVOService {

    public void insert(OrderVO orderVO);

    public List<OrderVO> orderVOList();

    public List<OrderVO> findByUserid(String userid);

    public void delete(Long id);

    public Long count();

    Page<OrderVO> findAll(Pageable pageable);

    public Optional<OrderVO> findById(Long id);

}
