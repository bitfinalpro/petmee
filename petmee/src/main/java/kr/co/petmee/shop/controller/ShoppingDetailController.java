package kr.co.petmee.shop.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.DeliInfo;
import kr.co.petmee.repository.vo.Purchase;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;

@Controller
public class ShoppingDetailController {

	@Autowired
	private ShoppingListService service;

	@RequestMapping("/shop/shoppinglistdetail/shoppinglistdetail.do")
	public void selectShoppingListDetail(Model model, HttpSession session) {
		User user = new User();
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		List<ShoppingList> list = service.ShoppingList(user);
		List<Coupon> coupon = service.couponList(user);

		model.addAttribute("coupon", coupon);
		model.addAttribute("list", list);
		model.addAttribute("order", user);
		System.out.println("sss");
	}

	@RequestMapping("/shop/shoppinglistdetail/payment.do")
	@ResponseBody
//	@Autowired
	public void payment(HttpSession session, DeliInfo deliInfo, String pay, String couponNo ) {

		User user = new User();
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		List<ShoppingList> list = service.ShoppingList(user);
		String orderNO = UUID.randomUUID() + "-" + user.getEmail();

		for (ShoppingList s : list) {
			System.out.println(s.getProduct());
			System.out.println(s.getEmail());
			System.out.println(s.getImage());
			Purchase p = new Purchase();
			p.setOrder_id(deliInfo.getEmail());
			p.setProduct_id(s.getProduct());
			p.setProduct_cnt(s.getAmount());
			p.setContent(s.getSubTitle());
			p.setPrice(s.getPrice());
			p.setEmail(s.getEmail());
			p.setPayment(pay);
			p.setDiscount(s.getDcprice());
			p.setImage(s.getImage());
			p.setOrderNo(orderNO);
			service.purchase(p);
		}
		deliInfo.setOrderNo(orderNO);
		service.deliInfo(deliInfo);
		service.couponDelete(couponNo);
	}

}
