package kr.co.petmee.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.shopping.service.MainService;

@Controller("kr.co.petmee.shopping.controller.ShoppingMain")
@RequestMapping("/main.do")
public class ShoppingMain {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/foodList.do")
	public void List(Model model) {
		model.addAttribute("food", service.foodList());
	} 
}
