package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class DeliInfo {
	
	private int no;
	private String name;
	private String phone;
	private String email;
	private int zipcode;
	private String address1;
	private String address2;
	private String content;
	private String order_id;
	private int coupon_dc;
	
}
