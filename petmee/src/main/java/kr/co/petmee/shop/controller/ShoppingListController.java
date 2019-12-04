package kr.co.petmee.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.repository.vo.ShoppingList;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;

@Controller
public class ShoppingListController {

	@Autowired
	private ShoppingListService service;
	
	@RequestMapping("/shop/shoppinglist/shoppinglist.do")
	public void selectShoppingList(Model model) {
		User user = new User();
		user.setEmail("y@y.com");
		List<ShoppingList> list =service.ShoppingList(user);
	
		model.addAttribute("list", list);
	}
	
}
