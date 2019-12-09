package kr.co.petmee.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.admin.service.ProductService;
import kr.co.petmee.repository.vo.Product;

@Controller("kr.co.petmee.admin.controller.ProductController")
@RequestMapping("/admin/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
			
	@RequestMapping("/product.do")
	public void List(Model model) {	
		//상품목록
		model.addAttribute("list",service.productList());
		//카테고리 목록
		model.addAttribute("cList",service.selectCatecories());
	   }
	
	@RequestMapping("/productRegister.do")
	public void WriteForm(Model model) {
		//상품목록
		model.addAttribute("list",service.productList());
		//카테고리 목록
		model.addAttribute("cList",service.selectCatecories());
	}
	
	@RequestMapping("/delete.do")	
	public String deleteProduct(String productId) {
		System.out.println("controller : " + productId);
		service.deleteProduct(productId);
		return "redirect:product.do";
	}
	
}
