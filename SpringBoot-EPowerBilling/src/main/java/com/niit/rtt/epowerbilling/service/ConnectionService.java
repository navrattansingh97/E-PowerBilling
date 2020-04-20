package com.niit.rtt.epowerbilling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.rtt.epowerbilling.model.*;
import com.niit.rtt.epowerbilling.repository.*;

@Service
@Transactional
public class ConnectionService {
	@Autowired
	ConnectionRepository repo;
	
	public void save(ConnectionDetails conn) {
		repo.save(conn);
	}
	
	public ConnectionDetails checkConn(int id)
	{
		return repo.findByConnectionId(id);
	}
	public ConnectionDetails fetchConnectionDetails(int id) {
		return repo.fetchConnectionDetails(id);
	}
}
