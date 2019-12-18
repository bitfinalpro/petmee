package kr.co.petmee.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ProductDAO;
import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO dao;
	
	// 제품이미지 등록 
	public void productImage(Image image) {
		dao.productImg(image);
	}
	// 제품이미지 등록 
	public void insertProduct(Product product) {
		dao.insertProduct(product);
	}
	//제품목록
	public List<Product> productList() {
		return dao.selectProducts();
	}
	//카테고리 추출
	public List<Product> selectCatecories(){
		return dao.selectCatecories();
	}
	//제품삭제
	public List<Product> deleteProduct(String productId) {
		dao.deleteProduct(productId);
		return dao.selectProducts();
	}
	//선택제품삭제
	public void deleteSelected(List<String> checkedbox) {
		for(String productId : checkedbox) {
			dao.deleteProduct(productId);
		}
	}
	//제품정보 추출
	public Product selectProductInfo(String productId) {
		return dao.selectProductInfo(productId);
	}
	//제품입고
	public void plusCount(HashMap map) {
		List<Product> list = (List<Product>)map.get("list");
		for(Product p : list) {
			dao.plusCount(p);
		}		
	}
	//제품출고
	public void minusCount(HashMap map) {
		List<Product> list = (List<Product>)map.get("list");
		for(Product p : list) {
			dao.minusCount(p);
		}		
	}
	//쿠폰등록
	public void registerCoupon(HashMap map) {
		List<Coupon> list = (List<Coupon>)map.get("list");
		for(Coupon c : list) {
			dao.registerCoupon(c);
		}		
	}
	//쿠폰중복검사
	public int checkCoupon(Coupon coupon) {
		int nameCnt = dao.checkCouponName(coupon.getName());
		int noCnt = dao.checkCouponNo(coupon.getNo());
		if (nameCnt == 1 && noCnt == 1) return 3;
		if (nameCnt == 1) return 1;
		if (noCnt == 1) return 2;
		
	    return 0;
	}
	//제품정보 변경
	public void updateProductInfo(Product product) {
			dao.updateProductInfo(product);
	}

}
