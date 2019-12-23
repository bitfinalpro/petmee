package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	
	private int no;                          // 글번호
	private String type;                   // 게시판 타입
	private String email;                 // 이메일
	private String title;
	private String content;               // 내용
	private int viewCnt;                  // 조회수
	private Date regDate;                // 날짜
	private int topChk;                   // 공지사항 체크
	private double horoscope;        // 별점
	private String product;              // 상품명
	private String proCatgo;            // 카테고리
	private int price;                      // 가격
	private String stringDate; //스트링형태 날짜
	

}
