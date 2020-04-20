package com.niit.rtt.epowerbilling.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.niit.rtt.epowerbilling.model.Payment;


public interface PaymentRepository  extends JpaRepository<Payment, Long>{

}
