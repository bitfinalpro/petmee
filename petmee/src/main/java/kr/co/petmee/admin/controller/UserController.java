package kr.co.petmee.admin.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.admin.service.UserService;
import kr.co.petmee.repository.dao.UserDAO;
import kr.co.petmee.repository.vo.User;

@Controller("kr.co.petmee.admin.controller.UserController")
@RequestMapping("/admin/user")
public class UserController {
	
@Autowired
private UserService service;

@Autowired
private UserDAO dao;

@RequestMapping("/userlist.do")
public void List(Model model) {
	List<User> uList = service.userList();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	for(User u : uList) {
		u.setStringUserDate(sdf.format(u.getRegDate()));
	}
	model.addAttribute("userList",uList);
   }

@RequestMapping("/userdelete.do")
public String delete(int userNo) {
	service.deleteUser(userNo);
	return "redirect:userlist.do";
}

}
