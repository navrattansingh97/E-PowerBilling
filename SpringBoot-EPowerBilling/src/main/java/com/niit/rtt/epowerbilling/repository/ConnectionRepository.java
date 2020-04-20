package com.niit.rtt.epowerbilling.repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.niit.rtt.epowerbilling.model.ConnectionDetails;
public interface ConnectionRepository extends CrudRepository<ConnectionDetails,Integer> {
	
	public ConnectionDetails findByConnectionId(int id);
	
	@Query("from ConnectionDetails where userId =?1")
	public ConnectionDetails fetchConnectionDetails(int id);
}
