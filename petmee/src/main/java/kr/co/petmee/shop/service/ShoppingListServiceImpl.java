package kr.co.petmee.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.ShoppingListDAO;
import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

@Service
public class ShoppingListServiceImpl implements ShoppingListService {

	@Autowired
	ShoppingListDAO dao;

	public List<ShoppingList> ShoppingList(User user) {
		return dao.selectShoppingList(user);
	}

	public List<ShoppingList> deleteList(User user, int no) {
		dao.deleteShoppingList(no);
		return dao.selectShoppingList(user);
	}

	public List<ShoppingList> alldeleteList(User user) {
		dao.alldeleteShoppingList(user);
		return dao.selectShoppingList(user);
	}

	@Override
	public List<ShoppingList> updateamount(Map<String, Integer> map, User user) {
		dao.updateamount(map);
		return dao.selectShoppingList(user);
	}

//	쿠폰정보 리스트
	public List<Coupon> couponList(User user) {
		return dao.selectCoupon(user);
	}

//	쿠폰 아이디 업데이트
	public List<Coupon> couponUpdate(Map<String, String> map, User user) {
		dao.updateCoupon(map);
		return dao.selectCoupon(user);
	}

}
