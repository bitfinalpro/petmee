package kr.co.petmee.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.board.service.QnaBoardService;
import kr.co.petmee.repository.dao.BoardDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.QnaBoard;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.controller.QnaBoardController")
@RequestMapping("/board/qnaboard")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService service;
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("/qna-list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model, Page page,
							@RequestParam(value="key",  defaultValue="0") int key, String val) {
		int count = 0;
		if(key == 0 || val == null) {
			
			model.addAttribute("list", service.listBoard(page));
			count = dao.selectBoardCount();
		}
		else {
			Search search = new Search();
			search.setListSize(page.getListSize());
			search.setPageNo(page.getPageNo());
			search.setKeyword(key);
			search.setSearchText(val);
			List<Board> list = service.searchlistBoard(page, search);
			model.addAttribute("list", list);
			count = list.size();
		}
		
		PageResult pr = new PageResult(pageNo, count);
		model.addAttribute("pr", pr);
		page = new Page(pageNo);
		  
		
	   }
	
	@RequestMapping("/qna-writeform.do")
	public void writeform() {}
	
	@RequestMapping("/qna-write.do")
	public String write(Board  board) {
		service.insertBoard(board);
		return "redirect:qna-list.do";
	}
	
	@RequestMapping("/qna-detail.do")
	public void detail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
	}
	
	@RequestMapping("/selectReportedMember.do")
	@ResponseBody
	public Comment selectReportedMember(int commentNo) {
		Comment c = service.selectReportedMember(commentNo);
		System.out.println(c.getEmail());
		System.out.println(c.getContent());
		System.out.println(c.getCommentNo());
		 return c;
	} 
	@RequestMapping("/qna-delete.do")
	public String delete(int no) {
		service.deleteBoard(no); 
		return "redirect:qna-list.do";
	}
	
	@RequestMapping(value="/qna-updateform.do" , method = {RequestMethod.GET ,  RequestMethod.POST})
	public void service(int no, Model model) throws Exception {
		model.addAttribute("board", service.updateFormBoard(no));
	}
	
	@RequestMapping(value="/qna-update.do" , method = {RequestMethod.GET ,  RequestMethod.POST})
	public String update(Board board) {
		service.updateBoard(board);
		return "redirect:qna-list.do";
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
