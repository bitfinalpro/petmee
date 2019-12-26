package kr.co.petmee.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ShoppingDAO;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private ShoppingDAO dao;
	
	// 상품 최신 리스트
	@Override
	public List<Product> foodList() {
		return dao.selectFood();
		
	}

	// 상품 베스트 리스트
	@Override
	public List<Product> bestList() {
		return dao.selectBest();
	}
	
	// 파일
	public List<Image> selectProductFile() {
		return dao.mainSelectProductFile();
	}

}
