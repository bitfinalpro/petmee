package kr.co.petmee.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.DeliInfo;
import kr.co.petmee.repository.vo.Purchase;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

@Service
public interface ShoppingListService {

	List<ShoppingList> ShoppingList(User user);

	List<ShoppingList> deleteList(User user, int no);

	List<ShoppingList> alldeleteList(User user);

	List<ShoppingList> updateamount(Map<String, Integer> map, User user);

//  결제후 장바구니 삭제하기
	void ShoppingListDelete(User user);
	
//	쿠폰
	List<Coupon> couponList(User user);

//	쿠폰 아이디 업데이트
	int couponUpdate(Map<String, String> map);

//	쿠폰 삭제
	void couponDelete(String no);

//	결제
//	배송지 등록
	void deliInfo(DeliInfo deliInfo);

//	구매 내역 등록
	void purchase(Purchase purchase);

//	구매내역 가져오기
	List<Purchase> purchaseList(Purchase purchase);


//	배송정보 가져오기
	DeliInfo DeliInfoList(String orderNo);
}
