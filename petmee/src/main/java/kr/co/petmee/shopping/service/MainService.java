package kr.co.petmee.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Product;

@Service
public interface MainService {
	
	List<Product> foodList();
}