package kr.co.petmee.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ShoppingListDAO;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

@Service
public class ShoppingListServiceImpl implements ShoppingListService {

	@Autowired
	ShoppingListDAO dao;
	
	public List<ShoppingList> ShoppingList(User user) {
		return dao.selectShoppingList(user);
	}
	
	public List<ShoppingList> deleteList(User user,int no) {
		dao.deleteShoppingList(no);
		return dao.selectShoppingList(user);
	}
	public List<ShoppingList> alldeleteList(User user,int no) {
		dao.alldeleteShoppingList(user);
		return dao.selectShoppingList(user);
	}

}
