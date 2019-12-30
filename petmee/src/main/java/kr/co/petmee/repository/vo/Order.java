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

}
