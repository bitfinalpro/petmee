package kr.co.petmee.board.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.repository.vo.NoticeBoard;

@Controller("kr.co.petmee.board.notice.controller.NoticeBoardController")
@RequestMapping("/board/notice")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService service;
	
	@RequestMapping("/notice.do")
	public void List(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("list", service.listBoard());
	}
	
	@RequestMapping("/detail.do")
	public void Detail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
	}
	
	@RequestMapping("/writeform.do")
	public void WriteForm() {}
	
	@RequestMapping("/write.do")
	public String Write(NoticeBoard board) {
		service.insertBoard(board);
		return "redirect:notice.do";
	}
	
}
