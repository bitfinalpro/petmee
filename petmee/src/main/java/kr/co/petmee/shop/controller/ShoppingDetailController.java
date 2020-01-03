package kr.co.petmee.shop.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.admin.service.OrderService;
import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.DeliInfo;
import kr.co.petmee.repository.vo.Order;
import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;

@Controller
public class ShoppingDetailController {

	@Autowired
	private ShoppingListService service;
	@Autowired
	private OrderService service1;
	
	

	@RequestMapping("/shop/shoppinglistdetail/shoppinglistdetail.do")
	public void selectShoppingListDetail(Model model, HttpSession session) {
		User user = new User();
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		String orderNo = UUID.randomUUID()+""/* + "-" + user.getEmail() */;
		List<ShoppingList> list = service.ShoppingList(user);
		List<Coupon> coupon = service.couponList(user);

		model.addAttribute("orderNo", orderNo);
		model.addAttribute("coupon", coupon);
		model.addAttribute("list", list);
		model.addAttribute("order", user);
		
		int scnt = service.ShoppingList(user).size();
		user.setShoppingCnt(scnt);
		session.setAttribute("user", user);
	}

	@RequestMapping("/shop/shoppinglistdetail/payment.do")
	@ResponseBody
	public void payment(HttpSession session, DeliInfo deliInfo, String pay, String couponNo , String orderNo) {

		User user = new User();
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		List<ShoppingList> list = service.ShoppingList(user);
		

		for (ShoppingList s : list) {
			Order o = new Order();

			o.setProductId(s.getProduct());
			o.setContent(s.getSubTitle());
			o.setProductCnt(s.getAmount());
			o.setPrice(s.getPrice());
			o.setUserId(s.getEmail());
			o.setPaymentMethod(pay);
			o.setDiscountRate(s.getDcprice());
			o.setImage(s.getImage());
			o.setOrderId(orderNo);
			service1.insertOrder(o);
		}
		deliInfo.setOrderNo(orderNo);
		service.deliInfo(deliInfo);
		service.couponDelete(couponNo);
		service.ShoppingListDelete(user);
		
		int scnt = service.ShoppingList(user).size();
		user.setShoppingCnt(scnt);
		session.setAttribute("user", user);
	}

}
