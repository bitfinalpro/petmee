package kr.co.petmee.websocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.petmee..websocket.controller.TestController")
@RequestMapping("/websocket")
public class TestController {

	@GetMapping("/test01.do")
	public void test01() {
	}
	
}
