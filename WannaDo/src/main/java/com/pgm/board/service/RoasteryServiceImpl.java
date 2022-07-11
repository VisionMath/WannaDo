package com.pgm.board.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.pgm.board.model.Roastery;
import com.pgm.board.repository.RoasteryRepository;

@Service
public class RoasteryServiceImpl implements RoasteryService {
	@Autowired
	private RoasteryRepository roasteryRepository;

	@PersistenceContext
	EntityManager em;

	@Override
	public List<Roastery> roasteryList() {
		// TODO Auto-generated method stub
		return roasteryRepository.findAll();
	}

	@Override
	public Page<Roastery> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return roasteryRepository.findAll(pageable);
	}

	@Transactional
	@Override
	public Roastery findByRid(Long rid) {
		// TODO Auto-generated method stub
		Roastery roastery = roasteryRepository.findByRid(rid);
		// roastery.setHitcount(roastery.getHitcount()+1);
		return roastery;
	}

	@Override
	public Long count() {
		// TODO Auto-generated method stub
		return roasteryRepository.count();
	}

}
