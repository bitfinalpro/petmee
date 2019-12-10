package kr.co.petmee.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Product;

@Service
public interface ProductService {
	//제품목록추출
	List<Product> productList();
	//카테고리 추출
	List<Product> selectCatecories();
	//제품삭제
	List<Product> deleteProduct(String productId);
	//선택제품삭제
	void deleteSelected(List<String> checkedbox);
	//제품 정보 추출
	Product selectProductInfo(String productId);
	//제품 입고
	void plusCount(HashMap map);
	//제품 입고
	void minusCount(HashMap map);
	
}
