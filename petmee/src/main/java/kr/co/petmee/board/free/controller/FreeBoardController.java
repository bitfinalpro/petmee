package kr.co.petmee.board.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.board.service.FreeBoardService;
import kr.co.petmee.repository.dao.FreeBoardDAO;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.FreeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.free.controller.FreeBoardController")
@RequestMapping("/freeboard")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@Autowired
	private FreeBoardDAO dao;
	
	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model, Page page) {
		
		model.addAttribute("list", service.listBoard(page));
		int count = dao.selectBoardCount(); 
		
		PageResult pr = new PageResult(pageNo, count);
		model.addAttribute("pr", pr);
		 page = new Page(pageNo);
		System.out.println("요청 페이지 번호 : " + pageNo);
		System.out.println("요청 페이지 시작 번호 : " + page.getBegin());
		System.out.println("요청 페이지 종료 번호 : " + page.getEnd());
		
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
	
	@RequestMapping("/delete.do")
	public String delete(int no) {
		service.deleteBoard(no); 
		return "redirect:list.do";
	}
	
	@RequestMapping(value="/updateform.do" , method = {RequestMethod.GET ,  RequestMethod.POST})
	public void service(int no, Model model) throws Exception {
		model.addAttribute("board", service.updateFormBoard(no));
	}
	
	@RequestMapping(value="/update.do" , method = {RequestMethod.GET ,  RequestMethod.POST})
	public String update(FreeBoard board) {
		service.updateBoard(board);
		return "redirect:list.do";
	}
	
	@RequestMapping("/comment_list.do")
	@ResponseBody
	public List<Comment> commentListAjax(int no) {
		return service.commentList(no);
	}
	
	@RequestMapping("/comment_regist.do")
	@ResponseBody
	public List<Comment> commentRegistAjax(Comment comment) {
		return service.commentRegist(comment);
	}
	
	@RequestMapping("/comment_delete.do")
	@ResponseBody
	public List<Comment> commentDeleteAjax(Comment comment) {
		return service.commentDelete(comment);
	}
	
	@RequestMapping("/comment_update.do")
	@ResponseBody
	public List<Comment> commentUpdateAjax(Comment comment) {
		return service.commentUpdate(comment);
	}
	
	
		
}
