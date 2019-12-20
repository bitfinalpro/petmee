package kr.co.petmee.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.LoginDAO;
import kr.co.petmee.repository.vo.User;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO dao; 
	
	// ------------------- 로그인 -------------------
	@Override
	public User login(User u) {
		return dao.selectLogin(u);
	}
	
	// ------------------- 회원가입 -------------------
	// 회원가입 등록
	public void insertJoin(User user) {
		dao.insertJoin(user);
	} 
	// 이메일 중복검사
	@Override
	public User emailcheck(String user) {
		return dao.emailcheck(user);
	}
	
	
	// ------------------- 마이페이지 -------------------
	// 메인리스트
	public List<User> selectMypage(int userNo) {
		return dao.selectMypage(userNo);
	}
	
	// 수정
	public void updateMypage(User user) {
		dao.updateMypage(user);
	}
	
	// 삭제
	public void deleteMypage(int no) {
		dao.deleteMypage(no); 
	}

	// ------------------- 이메일찾기/ 비번찾기 -------------------
	// 이메일 찾기
	@Override
	public String selectfind(User user) {
		return dao.selectfind(user);
	}
	// 비밀번호 찾기
	@Override
	public String selectpass(User user) {
		return dao.selectpass(user);
	}
}








