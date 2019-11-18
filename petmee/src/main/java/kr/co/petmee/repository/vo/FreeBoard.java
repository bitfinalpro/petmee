package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FreeBoard {
	private int no;
	private String writer;
	private String title;
	private String content;
	private int viewCnt;
	private Date regDate;

}
