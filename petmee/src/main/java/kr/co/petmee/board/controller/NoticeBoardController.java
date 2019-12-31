package kr.co.petmee.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.board.service.NoticeBoardService;
import kr.co.petmee.repository.dao.BoardDAO;
import kr.co.petmee.repository.vo.Board;
import kr.co.petmee.repository.vo.Page;
import kr.co.petmee.repository.vo.Search;
import kr.co.petmee.util.PageResult;

@Controller("kr.co.petmee.board.controller.NoticeBoardController")
@RequestMapping("/board/noticeboard")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService service;
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("/notice.do")
	public void List(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model
			,Page page, @RequestParam(value="keyword", defaultValue="0") int keyword, @RequestParam(value="searchText", defaultValue="")String searchText) {
		int count = 0;
		if (keyword == 0 || searchText == "") {
			page.setType("notice");
			model.addAttribute("list", service.listBoard(page));
			count = dao.selectBoardCount("notice");
		} else {
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
		model.addAttribute("listSize", service.selectListSize("notice"));
		page = new Page(pageNo);
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
