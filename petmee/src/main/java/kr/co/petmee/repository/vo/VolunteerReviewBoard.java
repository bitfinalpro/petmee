package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class VolunteerReviewBoard {
	private int no;
	private String title;
	private String writer;
	private String content;
	private int viewCnt;
	private Date regDate;
	
}
