package kr.co.petmee.board.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.board.service.ReviewBoardService;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.ReviewBoard;

@Controller("kr.co.petmee.board.review.controller.ReviewBoardController")
@RequestMapping("/reviewboard")
public class ReviewBoardController {

	@Autowired
	private ReviewBoardService service;
	
	@RequestMapping("/review_list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("list", service.listBoard());
	}
	
	@RequestMapping("/review_detail.do")
	public void detail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
	}
	
	@GetMapping("/review_writeform.do")
	public void writeform() {}
	
	@PostMapping("/review_write.do")
	public String write(ReviewBoard review) {
		service.insertBoard(review);
		return "redirect:review_list.do";
	}
	@GetMapping("/review_updateform.do")
	public void updateform(int no, Model model) throws Exception {
		model.addAttribute("board", service.updateFormBoard(no));
	}
	
	@PostMapping("/review_update.do")
	public String update(ReviewBoard board) {
		service.updateBoard(board);
		return "redirect:review_list.do";
	}
	
	
	@RequestMapping("/review_delete.do")
	public String delete(int no) {
		service.deleteBoard(no); 
		return "redirect:review_list.do";
	}
	
	@RequestMapping("/comment_update.json")
	   @ResponseBody
	   public List<Comment> commentUpdateAjax(Comment comment) {
	      return service.commentUpdate(comment);
	   }
	   
	   @RequestMapping("/comment_regist.do")
	   public List<Comment> commentRegistAjax(Comment comment) {
	      return service.commentRegist(comment);
	   }
	   
	   @RequestMapping("/comment_list.do")
	   @ResponseBody
	   public List<Comment> commentListAjax(int no) {
	      return service.commentList(no);
	   }
	   
	   @RequestMapping("/comment_delete.do")
	   @ResponseBody
	   public List<Comment> commentDeleteAjax(Comment comment) {
	      return service.commentDelete(comment);
	   }
}




