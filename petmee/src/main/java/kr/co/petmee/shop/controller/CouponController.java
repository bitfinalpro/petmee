package kr.co.petmee.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.repository.vo.Coupon;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;

@Controller
public class CouponController {

	@Autowired
	private ShoppingListService service;

	@RequestMapping("/shop/shoppinglistdetail/ajaxUpdateCoupon.do")
	@ResponseBody
	public Map<String, Object> ajaxUpdateCoupon(String no, HttpSession session) {
		User user = new User();
		user = (User) session.getAttribute("user");
		Map<String, String> map = new  HashMap<>();
		map.put("email", user.getEmail());
		map.put("no", no);
		
		int s = service.couponUpdate(map);
		Map<String ,Object> m = new HashMap<>();
		m.put("clist", service.couponList(user));
		m.put("state", s);
		System.out.println(s);
		
		return m;
	}

}
