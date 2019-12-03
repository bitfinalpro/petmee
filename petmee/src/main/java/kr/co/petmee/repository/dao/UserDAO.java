package kr.co.petmee.repository.dao;

import java.util.List;

import kr.co.petmee.repository.vo.User;

public interface UserDAO {
	
	List<User> selectUser();

}
