package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Report {
	
	private int reportNo;            // 신고번호
	private int no;                     // 글번호
	private String email;            // 신고한사람
	private String reportEmail;   // 신고당한사람
	private Date reportDate;       // 신고일자
	private String reportReason;  // 신고사유
	private String reportContent; // 신고내용
	private int boardType;          // 게시판 타입 (어느 게시판에서 가져왔는지)
	
		
}
