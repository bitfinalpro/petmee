package kr.co.petmee.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ShoppingDetailDAO;
import kr.co.petmee.repository.vo.ShoppingDetail;

@Service
public class ShoppingDetailServiceImpl {

	@Autowired
	private ShoppingDetailDAO dao;
	
	public List<ShoppingDetail> listBoard() {
		return dao.selectBoard();
	}
	
}
