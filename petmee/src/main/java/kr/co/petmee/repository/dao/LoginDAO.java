package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.User;

public interface LoginDAO {
	// --------------------------------------
		// 로그인
		User selectLogin(User user);

		// --------------------------------------
		// 회원가입
		void insertJoin(User user);
		
		// --------------------------------------
		// 마이페이지
		List<User> selectMypage();        // 조회
		void updateMypage(User user);     // 수정
		int deleteMypage(int no);		  // 삭제

}
