package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Purchase;
import kr.co.petmee.repository.vo.User;

public interface PurchaseDAO {
	
	List<Purchase> selectPurchase (User user);
	
	void insertPurchase(Purchase purchase);
}
