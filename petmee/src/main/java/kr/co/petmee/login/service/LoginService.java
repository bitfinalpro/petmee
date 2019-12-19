package kr.co.petmee.login.service;

import java.util.List;

import kr.co.petmee.repository.vo.User;

public interface LoginService {
	// ------------------- 로그인 -------------------
	User login(User u);
	
	
	// ------------------- 회원가입 -------------------
	void insertJoin(User user); 		// 등록
	User emailcheck(String user);		// 중복검사
	
	
	// ------------------- 마이페이지 -------------------
	List<User> selectMypage(int userNo);
	void updateMypage(User user);  
	void deleteMypage(int no);
	
	
	// ------------------- 이메일/비밀번호 찾기 -------------------
	String selectfind(User user); 		// 이메일 찾기
	String selectpass(User user); 		// 비밀번호 찾기
}
