package com.pgm.board.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.pgm.board.model.Roastery;

public interface RoasteryService {

	public List<Roastery> roasteryList();

	public Long count();

	public Page<Roastery> findAll(Pageable pageable);

	public Roastery findByRid(Long rid);

}
