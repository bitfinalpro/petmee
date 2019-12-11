package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Product {
	private int categoryNo;
	private String categoryName;
	private int animalNo;
	private String productName;
	private String productId;
	private String productInfo;
	private int price;
	private int stock;
	private String company;	
	private int productCount;	
	private int sellCondition;	
	private Date date;	
}
