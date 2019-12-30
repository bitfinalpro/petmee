package kr.co.petmee.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.admin.service.CouponService;
import kr.co.petmee.repository.vo.Coupon;

@Controller("kr.co.petmee.admin.controller.CouponController")
@RequestMapping("/admin/coupon")
public class CouponController {
	
	@Autowired
	private CouponService service;
	//전체 주문내역 추출
	@RequestMapping("/coupon.do")
	public Model CouponMain(Model model) {
		model.addAttribute("list",service.selectCouponList());
		return model;
	}

	// 쿠폰등록
	@RequestMapping(value = "/registerCoupon.do", method = RequestMethod.POST)
	@ResponseBody
	public void registerCoupon(@RequestBody List<Coupon> userList) {
		HashMap map = new HashMap();
		map.put("list", userList);
		service.registerCoupon(map);
	}
}
