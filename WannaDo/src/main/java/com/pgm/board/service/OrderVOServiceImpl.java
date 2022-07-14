package com.pgm.board.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.pgm.board.model.OrderVO;
import com.pgm.board.repository.OrderVORepository;

@Service
public class OrderVOServiceImpl implements OrderVOService {
    @Autowired
	private OrderVORepository orderVORepository;

    @PersistenceContext
    EntityManager em;

    @Transactional
    @Override
	public void insert(OrderVO orderVO) {
        // TODO Auto-generated method stub
		orderVORepository.save(orderVO);
    }

    @Override
	public List<OrderVO> orderVOList() {
        // TODO Auto-generated method stub
		return orderVORepository.findAll();
    }

    @Override
	public Page<OrderVO> findAll(Pageable pageable) {
        // TODO Auto-generated method stub
		return orderVORepository.findAll(pageable);
    }

    @Transactional
    @Override
    public List<OrderVO> findByUserid(String userid) {
        // TODO Auto-generated method stub
	List<OrderVO> orderList = orderVORepository.findByuserid(userid);
	return orderList;
    }

    @Override
    public void delete(Long id) {
        // TODO Auto-generated method stub
		orderVORepository.deleteById(id);
    }

    @Override
    public Long count() {
        // TODO Auto-generated method stub
		return orderVORepository.count();
    }

	@Override
	public Optional<OrderVO> findById(Long id) {
		// TODO Auto-generated method stub
		return orderVORepository.findById(id);
	}
}
