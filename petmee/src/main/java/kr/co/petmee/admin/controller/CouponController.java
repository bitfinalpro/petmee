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
	
	// 쿠폰명, 코드 중복검사
	@RequestMapping(value = "/checkCoupon.do", method = RequestMethod.POST)
	@ResponseBody
	public int checkCoupon(Coupon coupon) {
		// 중복 : 1 => 쿠폰명, 2=> 쿠폰번호 3 => 쿠폰명, 쿠폰번호  0 => 중복X
		return service.checkCoupon(coupon);
	}
	// 쿠폰삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String deleteCoupon(String no) {
		// 중복 : 1 => 쿠폰명, 2=> 쿠폰번호 3 => 쿠폰명, 쿠폰번호  0 => 중복X
		service.deleteCoupon(no);
		return "redirect:coupon.do";
	}

}
