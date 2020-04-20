package com.niit.rtt.epowerbilling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.rtt.epowerbilling.model.Address;
import com.niit.rtt.epowerbilling.repository.AddressRepository;

@Service
@Transactional
public class UserService {
	@Autowired
	private AddressRepository repo;

	public void save(Address add) {
		repo.save(add);
	}
}
