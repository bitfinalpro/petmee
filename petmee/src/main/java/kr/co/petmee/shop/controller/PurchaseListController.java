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
		user.setEmail(user.getEmail());
		
		 List<Purchase> plist = service.purchaseList(user);

		model.addAttribute("plist", plist);
		
	}
	
	@RequestMapping("/shop/purchaseList/purchaseDetail.do")
	public void purchaseDetail(HttpSession session, Model model ,String order_no) {
		User user = new User();
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		
		List<Purchase> plist = service.purchaseList(user);
		List<DeliInfo> dlist = service.DeliInfoList(order_no);
		model.addAttribute("plist", plist);
		model.addAttribute("dlist", dlist);
		
	}

}
