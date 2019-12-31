package kr.co.petmee.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.board.service.NoticeBoardService;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.controller.NoticeBoardController")
@RequestMapping("/board/noticeboard")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService service;
	
	
	@RequestMapping("/notice.do")
	public void List(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		Page p = new Page(pageNo);
		p.setType("notice");
		model.addAttribute("list", service.listBoard(p));
		model.addAttribute("pr", new PageResult(pageNo, service.selectBoardCount("notice")));
	}

	@RequestMapping("/detail.do")
	public void Detail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
	}
	
	@RequestMapping("/writeform.do")
	public void WriteForm() {}
	
	@RequestMapping("/write.do")
	public String Write(Board board) {
		service.insertBoard(board);
		return "redirect:notice.do";
	}
	
	@RequestMapping("/updateform.do")
	public void UpdateForm(int no, Model model) {
		model.addAttribute("board", service.updateFormBoard(no));
	}
	
	@RequestMapping("/update.do")
	public String Update(Board board) {
		service.updateBoard(board);
		return "redirect:notice.do";
	}
	
	@RequestMapping("/delete.do")
	public String Delete(int no) {
		service.deleteBoard(no);
		return "redirect:notice.do";
	}
	
}
