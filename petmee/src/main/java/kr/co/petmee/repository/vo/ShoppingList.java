package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class ShoppingList {

	private int no;
	private String email;
	private String product;
	private String subTitle;
	private int amount;
	private int price;
	private int oriprice;
	private int dcprice;
	private String image;
	private int tp;
	
	
}
