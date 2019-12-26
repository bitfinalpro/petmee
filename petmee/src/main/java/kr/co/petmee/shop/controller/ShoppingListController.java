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
public class ShoppingListController {

	@Autowired
	private ShoppingListService service;
	private User user;
	
	@RequestMapping("/shop/shoppinglist/shoppinglist.do")
	public void selectShoppingList(Model model,HttpSession session) {
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		List<ShoppingList> list = service.ShoppingList(user);

		model.addAttribute("list", list);
	}

	@RequestMapping("/shop/shoppinglist/deletelist.do")
	@ResponseBody
	public List<ShoppingList> delteteShoppingList(int no,HttpSession session) {
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		service.deleteList(user, no);

		return service.ShoppingList(user);
	}

	@RequestMapping("/shop/shoppinglist/alldeletelist.do")
	@ResponseBody
	public List<ShoppingList> alldelteteShoppingList(HttpSession session) {
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		service.alldeleteList(user);

		return service.ShoppingList(user);
	}

	@RequestMapping("/shop/shoppinglist/updateamount.do")
	@ResponseBody
	public List<ShoppingList> updateamount(int no, int amount ,int price , HttpSession session) {
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		Map<String, Integer> map = new HashMap<>();
		map.put("amount", amount);
		map.put("no", no);
		map.put("price", amount*price);
		service.updateamount(map, user);
		return service.ShoppingList(user);
	}

	@RequestMapping("/shop/shoppinglist/ajaxshoppinglist.do")
	@ResponseBody
	public List<ShoppingList> ajaxShoppingList(HttpSession session) {
		user = (User) session.getAttribute("user");
		user.setEmail(user.getEmail());
		return service.ShoppingList(user);
	}

}
