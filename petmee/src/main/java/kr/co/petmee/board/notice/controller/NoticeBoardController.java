package kr.co.petmee.board.notice.controller;


import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.petmee.repository.vo.NoticeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.notice.controller.NoticeBoardController")
@RequestMapping("/board/notice")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService service;
	
	
	@RequestMapping("/notice.do")
	public void List(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("list", service.listBoard(new Page(pageNo)));
		model.addAttribute("pr", new PageResult(pageNo, service.selectBoardCount()));
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
	
	@RequestMapping("/updateform.do")
	public void UpdateForm(int no, Model model) {
		model.addAttribute("board", service.updateFormBoard(no));
	}
	
	@RequestMapping("/update.do")
	public String Update(NoticeBoard board) {
		service.updateBoard(board);
		return "redirect:notice.do";
	}
	
	@RequestMapping("/delete.do")
	public String Delete(int no) {
		service.deleteBoard(no);
		return "redirect:notice.do";
	}
	
}
