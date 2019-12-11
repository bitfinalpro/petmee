package kr.co.petmee.repository.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private Date date;
	private int productCount;	
	private int sellCondition;	
	
	private List<MultipartFile> productfile;
	private List<MultipartFile> boardfile;
}
