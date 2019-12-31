package kr.co.petmee.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;
import kr.co.petmee.shopping.service.MainService;

@Controller("kr.co.petmee.main.controller.MainController")
public class MainController {
	@Autowired
	private MainService service;
	
	@Autowired
	private ShoppingListService service1;

	@RequestMapping("/main.do")
	public void main(Model model, String productId,HttpSession session) {

		List<Product> foodlist = service.foodList();
		// 최신 상품  이미지
		List<Image> flist =  service.selectProductFile();
		// 베스트 상품 이미지
		List<Image> mlist =  service.selectProductFile1();
		// 베스트 상품 
		List<Product> bestlist = service.bestList();
		// 베스트 & 세일 상품 이미지
		List<Image> sblist =  service.selectProductFile2();
		// 베스트 & 세일 상품
		List<Product> sailbest = service.selectSaleBest();	

		
		// 최신상품
		Collections.reverse(flist);
		Collections.reverse(foodlist);
		model.addAttribute("food", foodlist);
		model.addAttribute("flist",flist);
		
		// 베스트 상품 
		model.addAttribute("best", bestlist);
		// 베스트 이미지 
		model.addAttribute("mlist", mlist);	
		
		// 하단 세일베스트 이미지 
		model.addAttribute("sblist", sblist);			
		// 하단 세일베스트 상품 
		model.addAttribute("sailbest",sailbest);
		
		User user = new User();
		user = (User) session.getAttribute("user");
		if(user != null) {
		user.setEmail(user.getEmail());
		int scnt = service1.ShoppingList(user).size();
		user.setShoppingCnt(scnt);
		session.setAttribute("user", user);
		}
		
	}
}
