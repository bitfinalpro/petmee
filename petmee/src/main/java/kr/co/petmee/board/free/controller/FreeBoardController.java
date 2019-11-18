package kr.co.petmee.board.free.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.board.service.FreeBoardService;
import kr.co.petmee.repository.vo.FreeBoard;

@Controller("kr.co.petmee.board.free.controller.FreeBoardController")
@RequestMapping("/freeboard")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		System.out.println(sdf.format(service.listBoard().get(1).getRegDate()));
		System.out.println(service.listBoard().get(1).getTitle());
		model.addAttribute("list", service.listBoard());
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
	
	@GetMapping("/updateform.do")
	public void service(int no, Model model) throws Exception {
		model.addAttribute("board", service.updateFormBoard(no));
	}
	
	@PostMapping("/update.do")
	public String update(FreeBoard board) {
		service.updateBoard(board);
		return "redirect:list.do";
	}
	
	
}
