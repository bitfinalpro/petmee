package kr.co.petmee.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

@Service
public interface ProductService {
	// 제품 이미지 등록
	void productImage(Image image);
	// 제품 이미지 등록
	void insertProduct(Product product);
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
	//제품 정보 변경
	void updateProductInfo(Product product);
	//쿠폰등록
	void registerCoupon(HashMap map);
	//쿠폰 중복 검사
	int checkCoupon(Coupon coupon);
	//마지막 품번 뽑기
	int selectLastNumber(int categoryNo);
	//제품번호 중복검사
	int checkProductId(String productId);
}
