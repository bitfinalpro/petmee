package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ProductDAO;
import kr.co.petmee.repository.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO dao;
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
		System.out.println("Imple : " + productId);
		dao.deleteProduct(productId);
		return dao.selectProducts();
	}
}
