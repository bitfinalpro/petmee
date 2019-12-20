package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
	
	private int commentNo;  // 댓글번호
	private int no;               // 글 번호
	private String boardType; // 게시판타입
	private String email;      // 이메일
	private String Content;   // 내용
	private Date regDate;     // 시간

}
