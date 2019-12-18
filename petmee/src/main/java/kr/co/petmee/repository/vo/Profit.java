package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class Profit {
	private String date;
	private int profit;
	private int cnt;
	private String productId;
}
