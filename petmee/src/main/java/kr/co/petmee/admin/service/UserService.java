package kr.co.petmee.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.petmee.repository.vo.User;

@Service
public interface UserService {
	List<User> userList();	
	
	
	
	 void deleteUser(int userNo);

}
