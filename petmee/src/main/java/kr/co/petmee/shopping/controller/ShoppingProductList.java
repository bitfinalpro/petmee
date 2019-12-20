package kr.co.petmee.shopping.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.shopping.service.ProductListService;

@Controller("kr.co.petmee.shopping.controller.ShoppingProductList")
@RequestMapping("/shop")
public class ShoppingProductList {
	
	@Autowired
	private ProductListService service;
	
	@RequestMapping("/productList.do")
	public void productList(Model model, Integer categoryNo, String productId) {
		List<Product> product = service.ProductList(categoryNo);
		model.addAttribute("product", product);
		
		List<Image> img = service.ProductListImg(categoryNo);
		model.addAttribute("img", img);
	}
}