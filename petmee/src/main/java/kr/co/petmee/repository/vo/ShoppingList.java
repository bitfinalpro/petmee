package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class ShoppingList {

	private int no;
	private String email;
	private String name;
	private String explain;
	private int amount;
	private int price;
}
