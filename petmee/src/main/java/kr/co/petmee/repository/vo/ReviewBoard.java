package kr.co.petmee.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewBoard {
	private int no;           // 글번호
	private String writer;    // 작성자
	private String title;     // 제목
	private String content;   // 내용
	private Date regDate;     // 등록일
	private int views;        // 조회수
	private int price;        // 가격
	private String product;   // 제품명
	private String proCatgo;  // 별점
	private double horoscope; // 별점
}
