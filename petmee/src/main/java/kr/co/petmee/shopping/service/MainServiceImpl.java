package kr.co.petmee.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ShoppingDAO;
import kr.co.petmee.repository.vo.Product;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private ShoppingDAO dao;
	
	@Override
	public List<Product> foodList() {
		return dao.selectFood();
		
	}
}
