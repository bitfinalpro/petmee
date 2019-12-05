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
	
	// ------------------------------------
	// 로그인
	@Override
	public User login(User u) {
		return dao.selectLogin(u);
	}
	
	// ------------------------------------
	// 회원가입
	public void insertJoin(User user) {
		dao.insertJoin(user);
	}
	
	// ------------------------------------
	// 마이페이지
	public List<User> selectMypage() {
		return dao.selectMypage();
	}
	
	public void updateMypage(User user) {
		dao.updateMypage(user);
	}
	
	public void deleteMypage(int no) {
		dao.deleteMypage(no); 
	}

	@Override
	public User updateFormMypage(int no) {
		// TODO Auto-generated method stub
		return null;
	}

}








