package kr.co.petmee.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.board.service.VolunteerReviewBoardService;
import kr.co.petmee.repository.dao.VolunteerReviewBoardDAO;
import kr.co.petmee.repository.vo.Comment;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.repository.vo.VolunteerReviewBoard;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.activity.controller.ActivityBoardController")
@RequestMapping("/board/volunteerreviewboard")
public class ActivityBoardController {
	@Autowired
	private VolunteerReviewBoardService service;
	
	@Autowired
	private VolunteerReviewBoardDAO dao;
	
	//봉사후기 전체 게시물 목록 호출
	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model, Page page, @RequestParam(value="key", defaultValue="0") int key, String val) {
		int count = 0;
		if(key == 0 || val == null) {
		model.addAttribute("list", service.listBoard(page));
		count = dao.selectBoardCount(); 
		}
		else{
			Search search = new Search();
			search.setListSize(page.getListSize());
			search.setPageNo(page.getPageNo());
			search.setKeyword(key);
			search.setSearchText(val);
			List<VolunteerReviewBoard> list = service.searchlistBoard(page, search);
			model.addAttribute("list", list);
			count = list.size();
		}		
		
		PageResult pr = new PageResult(pageNo, count);
		model.addAttribute("pr", pr);
		page = new Page(pageNo);
	}
	
	//봉사후기 게시물 상세페이지 호출
	@RequestMapping("/detail.do")
	public void detail(int no, Model model) {
		model.addAttribute("board", service.detailBoard(no));
	}
	
	//봉사후기 게시물 삭제
	@RequestMapping("/delete.do")
	public String delete(int no) {
		service.deleteBoard(no); 
		return "redirect:list.do";
	}
	//게시물 작성 페이지 이동
	@RequestMapping("/writeform.do")
	public void writeform() {}
	
	//게시물 등록
	@RequestMapping("/write.do")
	public String write(VolunteerReviewBoard board) {
		service.insertBoard(board);
		return "redirect:list.do";
	}
	//봉사후기 게시물 수정페이지 이동
	@RequestMapping(value="/updateform.do" , method = {RequestMethod.GET ,  RequestMethod.POST})
	public void service(int no, Model model) throws Exception {
		model.addAttribute("board", service.detailBoard(no));
	}
	//봉사후기 게시물 수정
	@RequestMapping(value="/update.do" , method = {RequestMethod.GET ,  RequestMethod.POST})
	public String update(VolunteerReviewBoard board) {
		service.updateBoard(board);
		return "redirect:list.do";
	}
	//봉사후기 댓글 목록
	@RequestMapping("/comment_list.do")
	@ResponseBody
	public List<Comment> commentListAjax(int no) {
		return service.commentList(no);
	}
	//봉사후기 댓글 등록
	@RequestMapping("/comment_regist.do")
	@ResponseBody
	public List<Comment> commentRegistAjax(Comment comment) {
		return service.commentRegist(comment);
	}
	//봉사후기 댓글 삭제
	@RequestMapping("/comment_delete.do")
	@ResponseBody
	public List<Comment> commentDeleteAjax(Comment comment) {
		return service.commentDelete(comment);
	}
	//봉사후기 댓글 수정
	@RequestMapping("/comment_update.do")
	@ResponseBody
	public List<Comment> commentUpdateAjax(Comment comment) {
		return service.commentUpdate(comment);
	}
	
}
