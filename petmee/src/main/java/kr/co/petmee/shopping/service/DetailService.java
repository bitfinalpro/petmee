package kr.co.petmee.shopping.service;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Product;

@Service
public interface DetailService {
	
	Product ShoppingDetail(String productId);
}
