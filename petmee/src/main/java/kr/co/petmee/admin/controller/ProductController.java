package kr.co.petmee.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	//제품정보 삭제

	@RequestMapping("/delete.do")	
	public String deleteProduct(String productId) {
		service.deleteProduct(productId);
		return "redirect:product.do";
	}
	//선택 제품정보 삭제
	@RequestMapping("/deleteSelected.do")	
	@ResponseBody
	public void deleteSelected(@RequestBody List<String> checkedbox) {
		service.deleteSelected(checkedbox);
	}
	
	//제품정보 추출 ajax
	@RequestMapping("/input_list.do")
	@ResponseBody
	public Product selectProductInfo(String productId) {
		return service.selectProductInfo(productId);
	}
	
	//제품입고
	@RequestMapping(value="/plusCount.do", method=RequestMethod.POST)
	@ResponseBody
	public void plusCount(@RequestBody List<Product> userList) {
		for(Product p : userList) {
			System.out.println("id : " + p.getProductId());
		}
		HashMap map = new HashMap();
		map.put("list", userList);
		service.plusCount(map);		
	}
	//제품출고
	@RequestMapping(value="/minusCount.do", method=RequestMethod.POST)
	@ResponseBody
	public void minusCount(@RequestBody List<Product> userList) {
		for(Product p : userList) {
			System.out.println("id : " + p.getProductId());
		}
		HashMap map = new HashMap();
		map.put("list", userList);
		service.minusCount(map);		
	}
}
