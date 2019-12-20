package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Purchase {

	private int no ;
	private String order_id;
	private String product_id;
	private int product_cnt;
	private String content;
	private int price;
	private String status;
	private String email;
	private String refund;
	private String payment;
	private int discount;
	private Date regDate;
	
}
