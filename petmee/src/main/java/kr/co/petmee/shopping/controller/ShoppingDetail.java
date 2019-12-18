package kr.co.petmee.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.board.service.NoticeBoardService;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.shopping.service.DetailService;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.shopping.controller.ShoppingDetail")
@RequestMapping("/shop")
public class ShoppingDetail {
	
	@Autowired
	private DetailService service;
	
	@RequestMapping("/shoppingDetail.do")
	public void shoppingDetail(@RequestParam(value="pageNo", defaultValue="1") int pageNo, String productId, Model model) {	
		
		List<Image> list = service.SelectProductImage(productId);
		model.addAttribute("flist", list);
		model.addAttribute("product", service.ShoppingDetail(productId));
		model.addAttribute("list", service.listBoard(new Page(pageNo)));
		model.addAttribute("pr", new PageResult(pageNo, service.selectBoardCount()));
	}
	

}