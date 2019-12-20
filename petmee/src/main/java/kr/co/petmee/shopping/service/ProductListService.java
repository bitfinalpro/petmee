package kr.co.petmee.shopping.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

@Service
public interface ProductListService {
	
	//상품 리스트
	List<Product> ProductList(int categoryNo);
	//상품 이미지
	List<Image> ProductListImg(int categoryNo);
}
