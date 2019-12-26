package kr.co.petmee.shopping.controller;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.ProductListPage;
import kr.co.petmee.shopping.service.ShoppingProductService;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.shopping.controller.ShoppingProductList")
@RequestMapping("/shop")
public class ShoppingProductList {
	
	@Autowired
	private ShoppingProductService service;
	
	@RequestMapping("/productList.do")
	public void productList(ProductListPage plg, @RequestParam(defaultValue="1")int pageNo, Model model, Integer categoryNo) {
//		List<Product> product = service.ProductList(new PrsoductListPage(pageNo), categoryNo);
		List<Image> img = service.ProductListImg(categoryNo);
//		Collections.reverse(product);
		Collections.reverse(img);
		model.addAttribute("pr", new PageResult(pageNo, service.productListCount(),16,10));
		model.addAttribute("img", img);
		model.addAttribute("product", service.ProductList(plg));
	}
}