package kr.co.petmee.shopping.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.NoticeBoardDAO;
import kr.co.petmee.repository.dao.ParcelBoardDao;
import kr.co.petmee.repository.dao.ShoppingDAO;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ReviewBoard;

@Service
public class ProductListServiceImpl implements ProductListService{

	@Autowired
	private ShoppingDAO dao;
	
	@Override
	public List<Product> ProductList(int categoryNo) {
		return dao.productList(categoryNo);
	}

	@Override
	public List<Image> ProductListImg(int categoryNo) {
		return dao.productListImg(categoryNo);
	}

}
