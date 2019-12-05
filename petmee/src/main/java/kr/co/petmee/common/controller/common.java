package kr.co.petmee.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class common {

	@RequestMapping("sermernote.do")
	public void sermernote() {}
}
