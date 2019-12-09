package kr.co.petmee.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

		model.addAttribute("list", list);
	}

}
