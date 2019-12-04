package kr.co.petmee.repository.vo;

import lombok.Data;

@Data

public class User {
	private String email; // 이메일
	private int userNo; // 유저번호
	private String pass; // 비밀번호
	private String name; // 이름
	private String phone; // 핸드폰 번호
	private String resident; // 주민번호
	private String gender; // 성별
	private String withdrawal; // 탈퇴
	private String usertype; // 유저타입 ( 일반 / 관리자)
	private String nickname; // 닉네임 (쓸지말지)
	private String address; // 주소
	private int age; // 나이
}