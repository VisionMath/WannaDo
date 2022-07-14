package com.pgm.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pgm.board.model.OrderVO;

public interface OrderVORepository extends JpaRepository<OrderVO, Long> {

    public List<OrderVO> findByuserid(String userid);

}
