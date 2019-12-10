package kr.co.petmee.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

@Service
public interface ShoppingListService {

	List<ShoppingList> ShoppingList(User user);

	List<ShoppingList> deleteList(User user, int no);

	List<ShoppingList> alldeleteList(User user);

	List<ShoppingList> updateamount(Map<String, Integer> map, User user);

}