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
	// 제품 등록 
	public void insertProduct(Product product) {
		switch(product.getCategoryNo()) {
		case 1: product.setProductId("fd-" + product.getProductId()); break;
		case 2: product.setProductId("snk-" + product.getProductId()); break;
		case 3: product.setProductId("tsh-" + product.getProductId()); break;
		case 4: product.setProductId("sho-" + product.getProductId()); break;
		case 5: product.setProductId("acc-" + product.getProductId()); break;
		case 6: product.setProductId("bth-" + product.getProductId()); break;
		case 7: product.setProductId("bty-" + product.getProductId()); break;
		case 8: product.setProductId("tlt-" + product.getProductId()); break;
		case 9: product.setProductId("cln-" + product.getProductId()); break;
		case 10: product.setProductId("toy-" + product.getProductId()); break;
		}
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
	
	//제품정보 변경
	public void updateProductInfo(Product product) {
			dao.updateProductInfo(product);
	}
	//마지막 품번 뽑기
	public int selectLastNumber(int categoryNo) {
		String productId = dao.selectLastNumber(categoryNo);
		if(productId == null) return 0;
		else return Integer.parseInt(productId.split("-")[1]);
	}
	//마지막 품번 뽑기
	public int checkProductId(String productId) {
		return dao.checkProductId( productId);
	}

}
