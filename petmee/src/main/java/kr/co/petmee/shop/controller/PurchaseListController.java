package kr.co.petmee.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.repository.vo.DeliInfo;
import kr.co.petmee.repository.vo.Purchase;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;

@Controller
public class PurchaseListController {

	@Autowired
	private ShoppingListService service;

	@RequestMapping("/shop/purchaseList/purchaseList.do")
	public void PurchaseList(HttpSession session, Model model) {
		User user = new User();
		user = (User) session.getAttribute("user");

		Purchase purchase = new Purchase();
		purchase.setEmail(user.getEmail());

		List<Purchase> plist = service.purchaseList(purchase);

		model.addAttribute("plist", plist);

	}

	@RequestMapping("/shop/purchaseList/purchaseDetail.do")
	public void purchaseDetail(HttpSession session, Model model, String orderNo) {
		User user = new User();
		user = (User) session.getAttribute("user");

		Purchase purchase = new Purchase();
		purchase.setOrderNo(orderNo);
		
		List<Purchase> plist = service.purchaseList(purchase);
		DeliInfo dlist = service.DeliInfoList(orderNo);
		
		
		model.addAttribute("plist", plist);
		model.addAttribute("dlist", dlist);

	}

}
