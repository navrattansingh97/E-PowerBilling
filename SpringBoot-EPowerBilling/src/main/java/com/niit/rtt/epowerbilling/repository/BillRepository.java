package com.niit.rtt.epowerbilling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.niit.rtt.epowerbilling.model.BillDetails;

public interface BillRepository extends CrudRepository<BillDetails, Integer> {
	//@Query( "SELECT new com.niit.rtt.epowerbilling.model.UserBill(b.billId,b.billAmount,b.consumedUnits,b.dueDate,b.genertionDate,b.submitDate,b.`status`,b.`type`,u.user_Id,c.connectionId) from user u INNER JOIN billdetails b ON (u.user_id=b.userId) INNER JOIN connectiondetails c ON (u.user_id=c.userId) WHERE u.user_id =?1 AND b.status=?2") 
		@Query(value="Select * from BillDetails where userId =?1 and status =?2", nativeQuery=true)
		public BillDetails fetchBillById(int uId,String status);
		
		

		@Query("from BillDetails where userId = ?1")
		public List<BillDetails> fetchBillDetails(int uid);
		
		}
