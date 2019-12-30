package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Coupon {

	private String email;
	private String regDate;
	private	int discount;
	private String name;
	private String no;
	private int used;	
}
