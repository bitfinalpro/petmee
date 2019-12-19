package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaBoard {
	private int qnaNo;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private int viewCnt;
	private Date qnaRegDate;
	private int userNo;

}
