package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

public interface ProductDAO {
	
	// 제품 이미지등록  
	void productImg(Image image);
	// 제품 글등록  
	void insertProduct(Product product);
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
	//제품 정보 변경
	void updateProductInfo(Product product);
	//쿠폰등록
	void registerCoupon(Coupon coupon);
	//쿠폰명중복검사
	int checkCouponName(String name);
	//쿠폰번호중복검사
	int checkCouponNo(String no);
	//마지막 번호 추출
	String selectLastNumber(int categoryNo);
	//제품번호 중복검사
	int checkProductId (String productId);
}
