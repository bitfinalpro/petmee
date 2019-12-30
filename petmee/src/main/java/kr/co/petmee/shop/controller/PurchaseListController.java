package kr.co.petmee.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.admin.service.OrderService;
import kr.co.petmee.repository.vo.DeliInfo;
import kr.co.petmee.repository.vo.Order;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;

@Controller
public class PurchaseListController {

	@Autowired
	private OrderService service;
	@Autowired
	private ShoppingListService service1;

	@RequestMapping("/shop/purchaseList/purchaseList.do")
	public void PurchaseList(HttpSession session, Model model) {
		User user = new User();
		user = (User) session.getAttribute("user");

		Order order = new Order();
		order.setUserId(user.getEmail());

		List<Order> plist = service.selectOrder(order);

		for(Order p : plist ) {
			System.out.println(p.getProductCnt());
		}
		model.addAttribute("plist", plist);

	}

	@RequestMapping("/shop/purchaseList/purchaseDetail.do")
	public void purchaseDetail(HttpSession session, Model model, String orderNo) {
		User user = new User();
		user = (User) session.getAttribute("user");

		Order order = new Order();
		order.setOrderId(orderNo);
		
		List<Order> plist = service.selectOrder(order);
		DeliInfo dlist = service1.DeliInfoList(orderNo);
		
		String a = dlist.getPhone().substring(0,3);
		String b = dlist.getPhone().substring(3,7);
		String c = dlist.getPhone().substring(7,11);
		String p = a+"-"+b+"-"+c;
		dlist.setPhone(p);
		model.addAttribute("plist", plist);
		model.addAttribute("dlist", dlist);

	}

}
