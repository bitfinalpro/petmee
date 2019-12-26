package kr.co.petmee.shopping.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.shopping.service.ShoppingProductService;

@Controller("kr.co.petmee.shopping.controller.ShoppingProductPurchase")
@RequestMapping("/shop")
public class ShoppingProductPurchase {
	
	@Autowired
	private ShoppingProductService service;
	
	@RequestMapping("/shoppingProductPurchase.do")
	public String shoppingProductPurchase(Model model, HttpSession session, ShoppingList productInsert) {	

		service.insertProduct(productInsert);

		return "redirect:shoppinglist/shoppinglist.do";
	}
	

}