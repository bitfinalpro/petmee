package kr.co.petmee.board.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("kr.co.petmee.board.notice.controller.NoticeBoardController")
@RequestMapping("/board/notice")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService service;
	
	public void List(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("list", service.listBoard());
	}
	
}
