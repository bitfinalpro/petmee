package kr.co.petmee.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shopping.service.ShoppingProductService;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.shopping.controller.ShoppingDetail")
@RequestMapping("/shop")
public class ShoppingDetail {
	
	@Autowired
	private ShoppingProductService service;
	
	@RequestMapping("/shoppingDetail.do")
	public void shoppingDetail(@RequestParam(value="pageNo", defaultValue="1") int pageNo, String productId, Model model, HttpSession session) {	
		// 상품 이미지 
		List<Image> list = service.SelectProductImage(productId);
		model.addAttribute("flist", list);
		
		// 장바구니 상품이미지
		String imgfirst = list.get(0).getPath()+list.get(0).getOriName();
		model.addAttribute("imgfirst", imgfirst);
		
		// 해당상품 디테일 
		model.addAttribute("product", service.ShoppingDetail(productId));
		
		// 해당상품 게시판 
		Page rPage = new Page(pageNo);
		rPage.setType("review");
		rPage.setProductId(productId);
		model.addAttribute("list", service.reviewListBoard(rPage));
		model.addAttribute("pr", new PageResult(pageNo, service.selectBoardCount("review")));
	}
	

}