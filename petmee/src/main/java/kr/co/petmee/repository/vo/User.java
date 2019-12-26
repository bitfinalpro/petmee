package kr.co.petmee.repository.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data

public class User {
	private String email; // 이메일
	private int userNo; // 유저번호
	private String pass; // 비밀번호
	private String name; // 이름
	private String phone; // 핸드폰 번호
	private String home_phone; // 집 번호
	private String resident; // 주민번호
	private String gender; // 성별
	private String usertype; // 유저타입 (일반 / 관리자)
	private String address; // 주소
	private String address_detail; // 상세주소
	private int age; // 나이
	private Date regDate; // 가입 날짜
	private String stringUserDate; // 가입날짜 문자열
}