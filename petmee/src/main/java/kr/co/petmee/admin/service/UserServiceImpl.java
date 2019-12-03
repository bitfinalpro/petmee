package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.petmee.repository.dao.UserDAO;
import kr.co.petmee.repository.vo.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO dao;
	
	@Override
	public List<User> userList(){
		return dao.selectUser();
	}
	

}
