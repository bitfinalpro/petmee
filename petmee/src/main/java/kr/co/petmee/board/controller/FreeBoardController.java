package kr.co.petmee.board.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.board.service.FreeBoardService;
import kr.co.petmee.repository.dao.BoardDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.controller.FreeBoardController")
@RequestMapping("/board/freeboard")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model, Page page,
			                 @RequestParam(value="keyword",  defaultValue="0") int keyword, @RequestParam(value="searchText",  defaultValue="") String searchText) {
		int count = 0;
		if(keyword == 0 || searchText == "") {
			model.addAttribute("list", service.listBoard(page));
			count = dao.selectBoardCount("free");
		}
		else {
			Search search = new Search();
			search.setListSize(page.getListSize());
			search.setPageNo(page.getPageNo());
			search.setKeyword(keyword);
			search.setSearchText(searchText);
			List<Board> list = service.searchlistBoard(page, search);
			count = list.size();
			PageResult pr = new PageResult(pageNo, count);
			model.addAttribute("list", list);
			model.addAttribute("pr", pr);
			page = new Page(pageNo);
		}
		PageResult pr = new PageResult(pageNo, count);
		model.addAttribute("pr", pr);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchText", searchText);
		page = new Page(pageNo);
	   }
	@RequestMapping("/search.do")
	@ResponseBody
	public List<Board> selectSeachList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model, Page page, int keyword, @RequestParam(value="searchText",  defaultValue="") String searchText) {
		Search search = new Search();
		search.setListSize(page.getListSize());
		search.setPageNo(page.getPageNo());
		search.setKeyword(keyword);
		search.setSearchText(searchText);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(keyword == 0) {
		List<Board> list = service.listBoard(page);
		for(Board b : list) {
			b.setStringDate(sdf.format(b.getRegDate()));
		}
		return list;}
		List<Board> list = service.searchlistBoard(page, search);
		for(Board b : list) {
			b.setStringDate(sdf.format(b.getRegDate()));
		}		
		int count = list.size();
		PageResult pr = new PageResult(pageNo, count);
		model.addAttribute("pr", pr);
		page = new Page(pageNo);
		return list;
	}
	@RequestMapping("/writeform.do")
	public void writeform() {}
	
	@RequestMapping("/write.do")
	public String write(Board  board) {
		service.insertBoard(board);
		return "redirect:list.do";
	}
	
	@RequestMapping("/detail.do")
	public void detail(int no, int keyword, String searchText, Model model) {
		model.addAttribute("board", service.detailBoard(no));
		model.addAttribute("comment", service.commentList(no));
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchText", searchText);
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
	public String update(Board board) {
		service.updateBoard(board);
		return "redirect:list.do";
	}
	
	@RequestMapping("/comment_list.do")
	@ResponseBody
	public List<Comment> commentListAjax(int no, Model model) {
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
