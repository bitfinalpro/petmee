package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

public interface ShoppingDAO {
	List<Product> selectFood();
	
	// 메인이미지파일
	List<Image> mainSelectProductFile();
	
	// 상품 상세
	Product shoppingDetail(String productId);
	
	// 상품상세이미지파일
	List<Image> selectProductImage(String productId);
	
	// 상품 리스트
	List<Product> productList(int categoryNo);
	
	// 상품리스트이미지파일
	List<Image> productListImg(int categoryNo);

}
