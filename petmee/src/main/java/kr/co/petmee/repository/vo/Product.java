package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class Product {
	private String productId;
	private String productName;
	private String productInfo;
	private int price;
	private int productStock;
	private String campany;
	private int categoryNo;
	private int animalNo;
}
