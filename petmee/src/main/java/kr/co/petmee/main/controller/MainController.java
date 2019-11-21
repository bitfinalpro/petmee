package kr.co.petmee.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.petmee.main.controller.MainController")
public class MainController {
	
	@RequestMapping("/main.do")
	public void main() {}

}
