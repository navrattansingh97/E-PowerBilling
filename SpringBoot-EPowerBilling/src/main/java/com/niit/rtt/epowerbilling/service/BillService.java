package com.niit.rtt.epowerbilling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.rtt.epowerbilling.model.BillDetails;
import com.niit.rtt.epowerbilling.model.Payment;
import com.niit.rtt.epowerbilling.repository.BillRepository;
import com.niit.rtt.epowerbilling.repository.PaymentRepository;

@Service
@Transactional
public class BillService {
	@Autowired
	BillRepository repo;
	@Autowired
	PaymentRepository pRepo;
	
	public void save(BillDetails bill) {
		repo.save(bill);
	}
	
	public BillDetails fetchBillById(int uId,String status){
		return repo.fetchBillById(uId,status);

	}
	public List<BillDetails> fetchBillDetails(int uid){
		return (List<BillDetails>) repo.fetchBillDetails(uid);
	}
	
	public void save(Payment payment) {
		pRepo.save(payment);
	}
	
	public BillDetails fetchBill(int id) {
		return repo.findById(id).get();
	}
	
}
