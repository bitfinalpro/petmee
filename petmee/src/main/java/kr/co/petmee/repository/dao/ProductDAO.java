package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Product;

public interface ProductDAO {
	
	//전체 제품목록 추출
	List<Product> selectProducts();
	//카테고리 추출
	List<Product> selectCatecories();
	//제품삭제
	void deleteProduct(String productId);
}
