package kr.co.petmee.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.petmee.admin.main.controller.MainController")
@RequestMapping("/admin/user")
public class MainController {
	
	@RequestMapping("/menu.do")
	public void main() {}

}
