package kr.co.petmee.main.controller;

import java.util.List;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javafx.print.Collation;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.shopping.service.MainService;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.main.controller.MainController")
public class MainController {
	@Autowired
	private MainService service;

	@RequestMapping("/main.do")
	public void main(Model model, String productId) {

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
		
		
	}
}
