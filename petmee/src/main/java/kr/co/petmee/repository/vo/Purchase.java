package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Purchase {

	private int no ;
	private String orderId;
	private String productId;
	private int productCnt;
	private String content;
	private int price;
	private String status;
	private String email;
	private int discount;
	private Date regDate;
	private String image;
	private String payment;
	private String orderNo;
	
}
