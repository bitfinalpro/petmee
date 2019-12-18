package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.OrderDAO;
import kr.co.petmee.repository.vo.Order;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO dao;
	//주문내역 리스트 추출
	public List<Order> selectOrderList() {
		return dao.selectOrderList();
	}	
	//주문내역 상세
	public List<Order> detailOrder(String orderId) {
		return dao.detailOrder(orderId);
	}	
	//주문내역 삭제
	public void deleteOrder(String orderId) {
		dao.deleteOrder(orderId);
	}	
	//선택한 주문내역 삭제
	public void deleteSelected(List<String> checkedbox) {
		for(String orderId : checkedbox) {
		dao.deleteOrder(orderId);
		}
	}	
	//배송상태 변경
	public void updateStatus(Order order) {
		dao.updateStatus(order);
	}	
}
