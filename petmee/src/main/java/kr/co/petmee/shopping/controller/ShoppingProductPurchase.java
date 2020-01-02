package kr.co.petmee.shopping.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;
import kr.co.petmee.shopping.service.ShoppingProductService;

@Controller("kr.co.petmee.shopping.controller.ShoppingProductPurchase")
@RequestMapping("/shop")
public class ShoppingProductPurchase {
	
	@Autowired
	private ShoppingProductService service;
	
	@Autowired
	private ShoppingListService service1;
	
	@RequestMapping("/shoppingProductPurchase.do")
	public String shoppingProductPurchase(Model model, HttpSession session, ShoppingList productInsert) {	

		
		service.insertProduct(productInsert);
		
		User user = new User();
		
		user = (User) session.getAttribute("user");
		
		int scnt = service1.ShoppingList(user).size();
		user.setShoppingCnt(scnt);
		session.setAttribute("user", user);
		
		System.out.println(productInsert.getTp());
		if(productInsert.getTp() == 1) {
			return "redirect:/shop/shoppingDetail.do?productId="+productInsert.getProduct();
		}
		else return "redirect:shoppinglist/shoppinglist.do";
	}
	
	@RequestMapping("/shoppingProductPurchase1.do")
	public String shoppingProductPurchase1(Model model, HttpSession session, ShoppingList productInsert) {	
		
		
		service.insertProduct(productInsert);
		
		User user = new User();
		
		user = (User) session.getAttribute("user");
		
		int scnt = service1.ShoppingList(user).size();
		user.setShoppingCnt(scnt);
		session.setAttribute("user", user);
		
		return "redirect:shoppinglist/shoppingProductPurchase1.do";
	}
	

}