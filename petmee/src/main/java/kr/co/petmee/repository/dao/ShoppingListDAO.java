package kr.co.petmee.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

public interface ShoppingListDAO {

	List<ShoppingList> selectShoppingList(User user);

	void alldeleteShoppingList(User user);

	void deleteShoppingList(int no);

	void updateamount(Map<String, Integer> map);

	void deleteShoppingList(String email);

//	쿠폰정보 리스트
	List<Coupon> selectCoupon(User user);
//  쿠폰아이디 업데이트
<<<<<<< HEAD
	void updateCoupon (Map<String, String> map);
	


	List<ShoppingList> selectShoppingProduct(ShoppingList productInsert);
=======
	int updateCoupon (Map<String, String> map);
//	쿠폰삭제
	void deleteCoupon (String no);
>>>>>>> develop
}
