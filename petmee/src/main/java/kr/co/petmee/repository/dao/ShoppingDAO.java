package kr.co.petmee.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ProductListPage;

public interface ShoppingDAO {
	List<Product> selectFood();
	
	// 메인이미지파일
	List<Image> mainSelectProductFile();
	
	// 상품 상세
	Product shoppingDetail(String productId);
	
	// 상품상세이미지파일
	List<Image> selectProductImage(String productId);
	
	// 상품 리스트
	
	List<Product> productList(ProductListPage plg);
	
	// 상품 리스트 페이징 처리
	int productListCount();
	
	// 상품리스트이미지파일
	List<Image> productListImg(int categoryNo);



//	void productList(Map<String, Integer> map);

}
