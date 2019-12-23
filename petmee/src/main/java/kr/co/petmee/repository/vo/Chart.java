package kr.co.petmee.repository.vo;

import java.util.List;

import lombok.Data;

@Data
public class Chart {
	private List<Integer> countList;
	private List<Integer> priceList;
	private List<String> dateList;
	private List<Order> orderList;
	private String user_id;	
	private User user;
	private Product product;
}
