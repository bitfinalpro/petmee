package kr.co.petmee.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ShoppingDAO;
import kr.co.petmee.repository.vo.Product;

@Service
public class DeatilServiceImpl implements DetailService{
	
	@Autowired
	private ShoppingDAO dao;
	
	@Override
	public Product ShoppingDetail(String productId) {

		return dao.shoppingDetail(productId);

	}

}
