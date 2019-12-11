package kr.co.petmee.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.multipart.MultipartFile;


import kr.co.petmee.admin.service.ProductService;
import kr.co.petmee.repository.vo.Filevo;
import kr.co.petmee.repository.vo.Image;
import kr.co.petmee.repository.vo.Product;

@Controller("kr.co.petmee.admin.controller.ProductController")
@RequestMapping("/admin/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private ServletContext context;
			
	@RequestMapping("/product.do")
	public void List(Model model){	
		//상품목록
		model.addAttribute("list",service.productList());
		//카테고리 목록
		model.addAttribute("cList",service.selectCatecories());
	   }
	@RequestMapping("/productRegister.do")
	public void productRegister(Model model) {	
		//카테고리 목록
		model.addAttribute("cList",service.selectCatecories());
	   }
	@RequestMapping("/productRegister2.do")
	public String productRegister(Model model, Product product) throws Exception {	
		//카테고리 목록
		model.addAttribute("cList",service.selectCatecories());
		
//		파일 상세 이미지
		List<MultipartFile> getProductfile = product.getProductfile();
//		게시판 내부 파일(이미지)
		List<MultipartFile> getBoardfile = product.getBoardfile();
		
		service.insertProduct(product);
		
		// 이미지 파일	


		String bno = product.getProductId();
		
		
//		제품 상세 이미지 저장
		if (getProductfile.isEmpty() == false) {
			for (MultipartFile file : getProductfile) {
//			저장할때의 파일명(확장자 포함)
				String orgName = file.getOriginalFilename();
//			jsp 에서 보내오는 name명
				String Name = file.getName();
				System.out.println("name : " + Name);
//			파일 사이즈
				long size = file.getSize();
				System.out.println("size" + size);
//			저장되는 파일명
				String fileName = UUID.randomUUID() + orgName;
				System.out.println("fileName :" + fileName);
//			저장되는 경로
				String ysumpath = "/resources/upload/sum/";
				String sumpath = context.getRealPath(ysumpath);
				System.out.println(sumpath);
//			DB에 파일 정보 저장
//				객체생성
				Image image = new Image();
//			게시판정보에서 번호꺼내옴
				image.setProductId(bno);
//				업로드할떄의 파일명
				image.setName(file.getOriginalFilename());
//				실제 저장된 파일명
				image.setOriName(fileName);
//				저장된 경로
				image.setPath(ysumpath);
//				f.setPath(); 게시판 에서 

//				DB에 실제 저장
				service.productImage(image);

//		메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(sumpath + fileName));

			}
		}
		
		
		
		if (getBoardfile.isEmpty() == false) {
			for (MultipartFile file : getBoardfile) {
//			저장할때의 파일명(확장자 포함)
				String orgName = file.getOriginalFilename();
//			jsp 에서 보내오는 name명
				String Name = file.getName();
				System.out.println("name : " + Name);
//			파일 사이즈
				long size = file.getSize();
				System.out.println("size" + size);
//			저장되는 파일명
				String fileName = UUID.randomUUID() + orgName;
				System.out.println("fileName :" + fileName);
//			저장되는 파일경로
				String ypath = "/resources/upload/product/";
				String path = context.getRealPath(ypath);
				System.out.println(path);
//			DB에 파일 정보 저장
//				객체생성
				Image image = new Image();
//			게시판정보에서 번호꺼내옴
				image.setProductId(bno);
//				업로드할떄의 파일명
				image.setName(file.getOriginalFilename());
//				실제 저장된 파일명
				image.setOriName(fileName);
//				저장된 경로
				image.setPath(ypath);
//				f.setSumpath(sumpath);

//				DB에 실제 저장
				service.productImage(image);

//		메모리에 있는 파일을 실제 폴더에 저장
				file.transferTo(new File(path + fileName));
			}
		}
		
		return "redirect:product.do";
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
	//제품정보 변경 모달
	@RequestMapping("updateModal.do")
	@ResponseBody
	public Product updateProductInfo(String productId) {
		Product p = service.selectProductInfo(productId);
		return p;
	}
}
