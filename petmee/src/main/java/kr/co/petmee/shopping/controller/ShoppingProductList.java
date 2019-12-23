package kr.co.petmee.shopping.controller;


import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Product;
import kr.co.petmee.repository.vo.ProductListPage;
import kr.co.petmee.shopping.service.ProductListService;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.shopping.controller.ShoppingProductList")
@RequestMapping("/shop")
public class ShoppingProductList {
	
	@Autowired
	private ProductListService service;
	
	@RequestMapping("/productList.do")
	public void productList(ProductListPage plg, @RequestParam(defaultValue="1")int pageNo, Model model, Integer categoryNo) {
//		List<Product> product = service.ProductList(new PrsoductListPage(pageNo), categoryNo);
		System.out.println(plg.getPageNo());
		System.out.println(plg.getListSize());
		System.out.println(plg.getEnd());
		List<Image> img = service.ProductListImg(categoryNo);
		System.out.println(img.size());
		for(int i=0; i < img.size(); i++) {
			System.out.println(img.get(i).getPath()+img.get(i).getOriName());
		}
//		Collections.reverse(product);
		Collections.reverse(img);
		model.addAttribute("pr", new PageResult(pageNo, service.productListCount(),16,10));
		model.addAttribute("img", img);
		model.addAttribute("product", service.ProductList(plg));
	}
}