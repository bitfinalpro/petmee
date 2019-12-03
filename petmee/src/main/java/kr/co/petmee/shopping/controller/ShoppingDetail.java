package kr.co.petmee.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.petmee.shopping.controller.ShoppingDetail")
public class ShoppingDetail {
	@RequestMapping("/shopping/shoppingDetail.do")
	public void shoppingDetail() {}
}