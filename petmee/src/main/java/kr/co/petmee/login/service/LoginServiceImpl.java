package kr.co.petmee.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.LoginDAO;
import kr.co.petmee.repository.vo.Member;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDAO dao; // 스프링을 통해 자동 주입받는다.

	@Override
	public Member login(Member m) {
		return dao.selectLogin(m);
	}
}








