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
	private int dcPrice;
	private int oriPrice;
	private int price;
	private int stock;
	private String company;	
	private String orgProductId;	
	private Date date;
	private int productCnt;	
	private double sellRate;	
	private int sellCondition;	
	private List<MultipartFile> productfile;
	private List<MultipartFile> boardfile;
}
