package kr.co.petmee.repository.vo;

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
}
