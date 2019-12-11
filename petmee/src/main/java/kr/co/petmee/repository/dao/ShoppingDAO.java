package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

public interface ShoppingDAO {
	List<Product> selectFood();
	Product shoppingDetail(String productId);
	
	// 파일
	List<Image> selectProductFile(String a);
}
