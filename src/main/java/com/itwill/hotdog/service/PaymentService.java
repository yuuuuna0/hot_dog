package com.itwill.hotdog.service;

import java.util.List;

import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.repository.PaymentRepository;

public class PaymentService {
	private PaymentRepository paymentRepository;
	
	public PaymentService() throws Exception{
		this.paymentRepository=new PaymentRepository();
	}
	
	public List<Payment> findAll() throws Exception{
		return paymentRepository.findAllPayment();
	}
	public Payment findByPaymentNo(int pm_no) throws Exception{
		return paymentRepository.finByPaymentNo(pm_no);
	}

}
