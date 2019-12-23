package kr.co.petmee.shop.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.shop.service.ShoppingListService;

@Controller
public class PurchaseListController {

	@Autowired
	private ShoppingListService service;

	@RequestMapping("/shop/purchaseList/purchaseList.do")
	public void PurchaseList() {
	}

}
