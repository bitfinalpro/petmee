package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.Order;

@Service
public interface OrderService {
	//전체 주문내역
	List<Order> selectOrderList();
	//주문내역 삭제
	void deleteOrder(String orderId);
	//선택 주문내역 삭제
	void deleteSelected(List<String> checkedbox);
	//주문내역 상세
	List<Order> detailOrder(String orderId);
	//배송상태 변경
	void updateStatus(Order order);
}
