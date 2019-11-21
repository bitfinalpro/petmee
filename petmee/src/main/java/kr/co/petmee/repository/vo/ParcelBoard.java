package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ParcelBoard {

	private Integer no;
	private String title;
	private String writer;
	private String content;
	private Integer viewCnt;
	private Date regDate;
	
}
