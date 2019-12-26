package kr.co.petmee.shopping.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ProductListPage;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

@Service
public interface ShoppingProductService {
	
	// 상품 리스트
	List<Product> ProductList(ProductListPage plg);
	// 페이징처리
	int productListCount(int categoryNo);
	
	//상품 이미지
	List<Image> ProductListImg(int categoryNo);
	
	/*상품 디테일*/
	Product ShoppingDetail(String productId);
	/*상품 디테일 이미지*/
	List<Image> SelectProductImage(String productId);
	
	/*디테일 게시판*/
	List<Board> listBoard(Page page);
	int selectBoardCount(String type);
	
	/*구매버튼*/	
	void insertProduct(ShoppingList productInsert);
	List<ShoppingList> ShoppingProduct(ShoppingList productInsert);
}
