package kr.co.petmee.shopping.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ProductListPage;

@Service
public interface ProductListService {
	
	// 상품 리스트
	List<Product> ProductList(ProductListPage plg);
	// 페이징처리
	int productListCount();
	
	//상품 이미지
	List<Image> ProductListImg(int categoryNo);
	
}
