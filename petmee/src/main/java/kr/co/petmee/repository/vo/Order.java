package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Order {	
	private String orderId;
	private String userId;
	private String productId;
	private int productCnt;
	private int price;
	private String delieveryAddress;
	private String delieveryStatus;
	private String orderRequest;
	private Date orderDate;
	private String date;
	private String paymentMethod;
	private int userPhoneNo;
	private int discountRate;
	private int countOfProducts; //주문번호당 제품번호
	private int sumPrice; // 주문 번호당 총액
	private String orderedProduct;
	
}
