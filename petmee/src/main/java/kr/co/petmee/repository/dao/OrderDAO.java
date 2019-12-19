package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.Order;

public interface OrderDAO {
	//전체 주문내역
	List<Order> selectOrderList();
	//주문 삭제
	void deleteOrder(String orderId);
	//선택주문내역
	List<Order> detailOrder(String orderId);
	//배송상태 변경
	void updateStatus (Order order);
}
