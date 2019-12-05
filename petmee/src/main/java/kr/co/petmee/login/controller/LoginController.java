package kr.co.petmee.login.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.petmee.login.service.LoginService;
import kr.co.petmee.repository.vo.User;

@Controller("kr.co.petmee.login.controller.LoginController")
@RequestMapping("/shopping/login")
public class LoginController {
	@Autowired
	private ServletContext context;
	@Autowired
	private LoginService service;

	// --------------------------------------------------
	// 로그인
	@RequestMapping("/login.do")
	public String login(User u, HttpSession session) {
		User user = service.login(u);
		// 로그인 실패
		if (user == null) {
			return "redirect:/main.do";
		}
		// 로그인 성공 시 메인페이지 이동
		session.setAttribute("user", user);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/loginform.do")
	public void loginform() {}
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	
	// --------------------------------------------------
	// 마이페이지 (페이지 호출)
	@RequestMapping("/mypage.do")
	public void mypage() {}
	
	@RequestMapping("/mypageList.do")
	public void list(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
	     model.addAttribute("mypagelist", service.selectMypage());
	}
	
	@GetMapping("/mypageUpdateform.do")
	public void service(int no, Model model) throws Exception {
	   model.addAttribute("mypage", service.updateFormMypage(no));
	}
	
	@PostMapping("/mypageUpdate.do")
	public String update(User user) {
	   service.updateMypage(user);
	   return "redirect:/mypage.do";
	}
	
	@RequestMapping("/mypageDelete.do")
	public String delete(int no) {
	   service.deleteMypage(no); 
	   return "redirect:list.do";
	}
	
	
	// --------------------------------------------------
	// 회원가입
	@RequestMapping("/join.do")
	public void join() {}
	
	@RequestMapping("/join02.do")
	public String join02(User user) {
		service.insertJoin(user);
	    return "redirect:/main.do";
	}
	
	@RequestMapping("/joinform.do")
	public void join02() {}
	
}












