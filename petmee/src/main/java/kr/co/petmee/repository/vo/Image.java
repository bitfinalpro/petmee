package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class Image {
	private int fileNo;
	private int no;
	private String name;
	private String oriName;
	private String path;
	private String email;
	private String type;
	private String productId;
	private int categoryNo;
}
