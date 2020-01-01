package kr.co.petmee.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ProductListPage;
import kr.co.petmee.repository.vo.ReviewBoard;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

public interface ShoppingDAO {
	// 메인 최신 리스트
	List<Product> selectFood();

	// 메인 베스트 리스트
	List<Product> selectBest();
	
	// 메인 각 항목 세일베스트 리스트
	List<Product> selectSaleBest();
	
	// 메인이미지파일
	List<Image> mainSelectProductFile();
	
	// 상품 상세
	Product shoppingDetail(String productId);
		
	// 상품상세이미지파일
	List<Image> selectProductImage(String productId);
	
	// 상품 리스트
	
	List<Product> productList(ProductListPage plg);
	
	// 상품 리스트 페이징 처리
	int productListCount(int categoryNo);
	
	// 상품리스트이미지파일
	List<Image> productListImg(int categoryNo);

	// 상품 구매 버튼 이동
	void insertProduct(ShoppingList productInsert);


}
