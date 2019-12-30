package kr.co.petmee.shopping.controller;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;
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
		List<Product> pro = service.ProductList(plg);
		int catepro = pro.get(0).getCategoryNo();
		switch(catepro) {
	    case 1: 
	    	model.addAttribute("pr", new PageResult(pageNo, service.productListCount(1),16,10));
	    	break;
	    case 2: 
	    	model.addAttribute("pr", new PageResult(pageNo, service.productListCount(2),16,10));
	         break;
	    case 3: 
	    	model.addAttribute("pr", new PageResult(pageNo, service.productListCount(3),16,10));
	         break;
	    case 4: 
	    	model.addAttribute("pr", new PageResult(pageNo, service.productListCount(4),16,10));
	    	break;
	    default: 
	    	model.addAttribute("pr", new PageResult(pageNo, service.productListCount(5),16,10));
	         break;
	}
		
//		Collections.reverse(product);
		Collections.reverse(img);
		
		model.addAttribute("img", img);
		model.addAttribute("catepro", catepro);
		model.addAttribute("product", pro);
	}
}