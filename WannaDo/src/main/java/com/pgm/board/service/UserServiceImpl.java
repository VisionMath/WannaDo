package com.pgm.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pgm.board.model.User;
import com.pgm.board.repository.UserRepository;

import lombok.extern.java.Log;

@Service
@Log
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	// 작업중 중복 아이디 검사.
	@Override
	public boolean existsByUserid(String userid) {
		// TODO Auto-generated method stub
		return userRepository.existsByUserid(userid);
	}

	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		userRepository.save(user);
	}

	@Override
	public User findByUserid(String userid) {
		// TODO Auto-generated method stub
		return userRepository.findByUserid(userid);
	}

}
