package com.niit.rtt.epowerbilling.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.niit.rtt.epowerbilling.model.User;
import com.niit.rtt.epowerbilling.repository.LoginUserRepository;

@Service
@Transactional
public class LoginUserService {
	@Autowired
	private LoginUserRepository repo;

	public void save(User user)
	{
		repo.save(user);
	}
	public User checkUser(String email) {
		return repo.findByEmail(email);
	}
	public List<User> listAll()
	{
		return (List<User>) repo.findAll();
	}
	public User find(int id)
	{
		return repo.findById(id).get();
	}
	public void delete(int id)
	{
		repo.deleteById(id);
	}
}
