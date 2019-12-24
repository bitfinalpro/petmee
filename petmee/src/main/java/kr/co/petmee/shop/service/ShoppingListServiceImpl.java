package kr.co.petmee.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.DeliInfoDAO;
import kr.co.petmee.repository.dao.PurchaseDAO;
import kr.co.petmee.repository.dao.ShoppingListDAO;
import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.DeliInfo;
import kr.co.petmee.repository.vo.Purchase;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;

@Service
public class ShoppingListServiceImpl implements ShoppingListService {

	@Autowired
	ShoppingListDAO dao1;
	@Autowired
	DeliInfoDAO dao2;
	@Autowired
	PurchaseDAO dao3;

	public List<ShoppingList> ShoppingList(User user) {
		return dao1.selectShoppingList(user);
	}

	public List<ShoppingList> deleteList(User user, int no) {
		dao1.deleteShoppingList(no);
		return dao1.selectShoppingList(user);
	}

	public List<ShoppingList> alldeleteList(User user) {
		dao1.alldeleteShoppingList(user);
		return dao1.selectShoppingList(user);
	}

	public List<ShoppingList> updateamount(Map<String, Integer> map, User user) {
		dao1.updateamount(map);
		return dao1.selectShoppingList(user);
	}

//	쿠폰정보 리스트
	public List<Coupon> couponList(User user) {
		return dao1.selectCoupon(user);
	}

//	쿠폰 아이디 업데이트
	public int couponUpdate(Map<String, String> map) {
		return dao1.updateCoupon(map);
	}
	
//	쿠폰 삭제
	public void couponDelete(String no) {
		dao1.deleteCoupon(no);
	}

//	결제 
//	배송지 등록
	public void deliInfo(DeliInfo deliInfo) {
		dao2.insertDeliInfo(deliInfo);
	}

//	구매 내역 등록 
	public void purchase(Purchase purchase) {
		dao3.insertPurchase(purchase);
	}

//  구매내역 가져오기
	public List<Purchase> purchaseList(Purchase purchase) {
		return dao3.selectPurchase(purchase);
	}

//	배송정보 가져오기
	public DeliInfo DeliInfoList(String orderNo) {
		return dao2.selectDeliInfo(orderNo);
	}

	

}
