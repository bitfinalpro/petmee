package kr.co.petmee.login.service;

import java.util.List;

import kr.co.petmee.repository.vo.User;

public interface LoginService {
	// --------------------------------
	// 로그인
	User login(User u);
	
	// --------------------------------
	// 회원가입
	void insertJoin(User user);
	
	// --------------------------------
	// 마이페이지
	List<User> selectMypage(int userNo);
	User updateFormMypage(int no);
	void updateMypage(User user);  
	void deleteMypage(int no);		
}
