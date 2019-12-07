package kr.co.petmee.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.MainDAO;
import kr.co.petmee.repository.vo.Product;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDAO dao;
	
	@Override
	public List<Product> foodList() {
		return dao.selectFood();
	}
}
