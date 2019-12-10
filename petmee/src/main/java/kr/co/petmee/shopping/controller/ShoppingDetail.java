package kr.co.petmee.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.shopping.service.DetailService;

@Controller("kr.co.petmee.shopping.controller.ShoppingDetail")
@RequestMapping("/shop")
public class ShoppingDetail {
	
	@Autowired
	private DetailService service;
	
	@RequestMapping("/shoppingDetail.do")
	public void shoppingDetail(String productId, Model model) {
		model.addAttribute("product", service.ShoppingDetail(productId));
	}
}