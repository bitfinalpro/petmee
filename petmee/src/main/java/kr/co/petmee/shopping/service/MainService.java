package kr.co.petmee.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

@Service
public interface MainService {
	
	//상품 최신 리스트
	List<Product> foodList();
	
	// 상품 베스트 리스트
	List<Product> bestList();
	
	// 각 항목 세일 베스트 리스트
	List<Product> selectSaleBest();
	
	//상품 이미지
	List<Image> selectProductFile();
}
