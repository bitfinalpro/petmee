package kr.co.petmee.shopping.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.BoardDAO;
import kr.co.petmee.repository.dao.ShoppingDAO;
import kr.co.petmee.repository.dao.ShoppingListDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ProductListPage;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

@Service
public class ShoppingProductServiceImpl implements ShoppingProductService{

	@Autowired
	private ShoppingDAO dao;	
	@Autowired
	private BoardDAO boardDao;
	@Autowired
	ShoppingListDAO userDao;

	
	/* ----------상품 리스트 -------------------*/
	@Override
	public List<Product> ProductList(ProductListPage plg) {
		return dao.productList(plg);
	}

	@Override
	public int productListCount(int categoryNo) {
		return dao.productListCount(categoryNo);
	}
	
	@Override
	public List<Image> ProductListImg(int categoryNo) {
		return dao.productListImg(categoryNo);
	}
	
	/* ----------상품 디테일 -------------------*/
	@Override
	public Product ShoppingDetail(String productId) {
		return dao.shoppingDetail(productId);
	}
	
	@Override
	public List<Image> SelectProductImage(String productId) {
		return dao.selectProductImage(productId);
	}
	
	/* ----------상품 디테일  게시판 리스트 -------------------*/
	
	@Override
	public List<Board> listBoard(Page page) {
		return boardDao.selectBoard(page);
	}
	@Override
	public int selectBoardCount(String type) {	
		return boardDao.selectBoardCount(type);
	}
	@Override
	public List<Board> reviewListBoard(Page page) {
		return boardDao.reviewListBoard(page);
	}	
	/* -----------------상품 구매 -------------------*/
	
	@Override
	public void insertProduct(ShoppingList productInsert) {	
		dao.insertProduct(productInsert);
	}
	public List<ShoppingList> ShoppingProduct(ShoppingList productInsert) {
		return userDao.selectShoppingProduct(productInsert);
	}


}
