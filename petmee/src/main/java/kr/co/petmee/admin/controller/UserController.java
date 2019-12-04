package kr.co.petmee.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.admin.service.UserService;
import kr.co.petmee.repository.dao.UserDAO;

@Controller("kr.co.petmee.admin.controller.UserController")
@RequestMapping("/admin/user")
public class UserController {
	
@Autowired
private UserService service;

@Autowired
private UserDAO dao;

@RequestMapping("/userlist.do")
public void List(Model model) {
	model.addAttribute("userList",service.userList());
   }

@RequestMapping("/userdelete.do")
public String delete(int userNo) {
	service.deleteUser(userNo);
	return "redirect:userlist.do";
}

}
