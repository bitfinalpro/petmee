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

		List<Product> foodlist = service.foodList();
		List<Image> flist =  service.selectProductFile();
		List<Product> bestlist = service.bestList();
		List<Product> sailbest = service.selectSaleBest();	
		
		for(int i = 0; i < bestlist.size(); i++) {
			System.out.println(bestlist.get(i).getProductName());
		}
		String a = flist.get(0).getPath() + flist.get(0).getOriName();
		model.addAttribute("a",a);

		Collections.reverse(foodlist);
		Collections.reverse(flist);
		model.addAttribute("sailbest",sailbest);
		model.addAttribute("best", bestlist);
		model.addAttribute("food", foodlist);
		model.addAttribute("flist",flist);
	}
}
