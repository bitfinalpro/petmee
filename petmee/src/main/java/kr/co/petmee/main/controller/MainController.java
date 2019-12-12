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

@Controller("kr.co.petmee.main.controller.MainController")
public class MainController {
	@Autowired
	private MainService service;

	@RequestMapping("/main.do")
	public void main(Model model) {

//		for (Image a:service.selectProductFile()) {			
//			System.out.println(a.getPath()+a.getOriName());
//		}
		List<Product> foodlist = service.foodList();
		Collections.reverse(foodlist);
		model.addAttribute("food", foodlist);
		model.addAttribute("flist", service.selectProductFile());
	}
}
