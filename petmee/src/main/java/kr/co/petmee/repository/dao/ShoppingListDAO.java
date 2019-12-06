package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

public interface ShoppingListDAO {
	
	List<ShoppingList> selectShoppingList(User user);
	
	void alldeleteShoppingList(User user);
	
	void deleteShoppingList(int no);
}
