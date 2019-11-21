package kr.co.petmee.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.board.service.FreeBoardService;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.FreeBoard;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.controller.FreeBoardController")
@RequestMapping("/board/freeboard")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		  model.addAttribute("list", service.listBoard(new Page(pageNo)));
	      model.addAttribute("pr", new PageResult(pageNo, service.selectBoardCount()));
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
