package com.itwill.hotdog.service;

import java.util.List;

import com.itwill.hotdog.domain.Delivery;
import com.itwill.hotdog.repository.DeliveryRepository;

public class DeliveryService {
	private DeliveryRepository deliveryRepository;
	public DeliveryService() throws Exception {
		deliveryRepository=new DeliveryRepository();
	}
	
	public int create(Delivery delivery) throws Exception {
		return deliveryRepository.insert(delivery);
	}
	public int deleteAll(String sUserId) throws Exception{
		return deliveryRepository.deletAllByUser(sUserId);
	}
	public int deleteByDeliberyyNo(int d_no) throws Exception {
		return deliveryRepository.deletByDeliveryNo(d_no);
	}
	public List<Delivery> findByUserId(String sUserId) throws Exception{
		return deliveryRepository.findDeliveryListByUser(sUserId);
	}
	public Delivery findByDeliveryNo(int d_no) throws Exception{
		return deliveryRepository.findByDeliveryNo(d_no);
	}
	public Delivery updateByDeliveryBo(int d_no) throws Exception {
		return deliveryRepository.updateByDeliveryNo(d_no);
	}
}
