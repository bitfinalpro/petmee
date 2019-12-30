package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private String orderId;
	private String productId;
	private int productCnt;
	private int price;
	private String delieveryStatus;
	private Date orderDate;
	private String paymentMethod;
	private String userId;
	private int discountRate;

	private String image;
	private String content;

	private String delieveryAddress;
	private String orderRequest;
	private String date;
	private int userPhoneNo;
	private int countOfProducts; // 주문번호당 제품번호
	private int sumPrice; // 주문 번호당 총액
	private String orderedProduct;

}
