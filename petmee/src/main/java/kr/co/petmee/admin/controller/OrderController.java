package kr.co.petmee.admin.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.admin.service.OrderService;
import kr.co.petmee.repository.vo.Order;

@Controller("kr.co.petmee.admin.controller.OrderController")
@RequestMapping("/admin/order")
public class OrderController {
	
	@Autowired
	private OrderService service;
	//전체 주문내역 추출
	@RequestMapping("/order.do")
	public Model orderMain(Model model) {
		model.addAttribute("list",service.selectOrderList());
		return model;
	}
	//선택 주문내역 추출
	@RequestMapping("/detailOrder.do")
	@ResponseBody
	public Order detailOrder(String orderId) {
		List<Order> oList = service.detailOrder(orderId);
		Order order = oList.get(0);
		System.out.println(order.getOrderDate());
		System.out.println(oList.get(0).getOrderDate());
		String orderedProduct = "";
		int totalPrice = 0;
		for(Order o : oList) {
			orderedProduct += "<div><p>품번 : " + o.getProductId() + "</p><p>수량: " + o.getProductCnt() +"<p>금액: " + o.getPrice() + "</p></div>";
			totalPrice += o.getPrice();
		}
		order.setPrice(totalPrice);
		order.setOrderedProduct(orderedProduct);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(order.getOrderDate());
		System.out.println(date);
		order.setDate(date);
		System.out.println(order.getDate());
		return order;
	}
	//주문내역 삭제
	@RequestMapping("/delete.do")
	public String deleteOrder(String orderId) {
		service.deleteOrder(orderId);
		return "redirect:order.do";
	}
	//선택 주문정보 삭제
		@RequestMapping("/deleteSelected.do")	
		@ResponseBody
		public void deleteSelected(@RequestBody List<String> checkedbox) {
			service.deleteSelected(checkedbox);			
		}
	// 배송정보 변경
	@RequestMapping("/updateStatus.do")
	@ResponseBody
	public String updateStatus(Order order) {
		service.updateStatus(order);
		return order.getDelieveryStatus();
	}
}
