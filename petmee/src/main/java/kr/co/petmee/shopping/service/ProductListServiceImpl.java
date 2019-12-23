package kr.co.petmee.shopping.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ShoppingDAO;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ProductListPage;

@Service
public class ProductListServiceImpl implements ProductListService{

	@Autowired
	private ShoppingDAO dao;

	@Override
	public List<Product> ProductList(ProductListPage plg) {
		return dao.productList(plg);
	}

	@Override
	public int productListCount() {
		return dao.productListCount();
	}
	
	@Override
	public List<Image> ProductListImg(int categoryNo) {
		return dao.productListImg(categoryNo);
	}

}
