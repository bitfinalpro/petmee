package kr.co.petmee.board.free.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.board.service.FreeBoardService;
import kr.co.petmee.repository.vo.FreeBoard;

@Controller("kr.co.petmee.board.free.controller.FreeBoardController")
@RequestMapping("/freeboard")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("list", service.listBoard());
	}
	
	@RequestMapping("/writeform.do")
	public void writeform() {}
	
	@RequestMapping("/write.do")
	public String write(FreeBoard  board) {
		service.insertBoard(board);
		return "redirect:list.do";
	}
	
	@RequestMapping("/detail.do")
	public void detail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
	}
	
	
}
