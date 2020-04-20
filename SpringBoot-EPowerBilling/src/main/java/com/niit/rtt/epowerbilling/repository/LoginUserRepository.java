package com.niit.rtt.epowerbilling.repository;

import org.springframework.data.repository.CrudRepository;

import com.niit.rtt.epowerbilling.model.User;

public interface LoginUserRepository  extends CrudRepository<User, Integer> {
	public User findByEmail(String email);
}
