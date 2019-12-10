package kr.co.petmee.repository.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.petmee.repository.vo.Product;

public interface ProductDAO {
	
	//전체 제품목록 추출
	List<Product> selectProducts();
	//카테고리 추출
	List<Product> selectCatecories();
	//제품삭제
	void deleteProduct(String productId);
	//제품 정보 추출
	Product selectProductInfo(String productId);
	//제품 입고
	void plusCount(Product product);
	//제품 출고
	void minusCount(Product product);
}
