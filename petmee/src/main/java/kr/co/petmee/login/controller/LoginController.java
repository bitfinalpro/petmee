package kr.co.petmee.login.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.petmee.login.service.LoginService;
import kr.co.petmee.repository.vo.Member;

@Controller("kr.co.petmee.login.controller.LoginController")
@RequestMapping("/main/member")
public class LoginController {
	// Spring에서 정보를 어노테이션으로 가져올수있음
	
	@Autowired
	private ServletContext context; // Path경로를 얻어올 수 있다.
	
	@Autowired
	private LoginService service;

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginform.do";
	}
	
	@RequestMapping("/mypage.do")
	public void mypage() {}
	
	@RequestMapping("/loginform.do")
	public void loginform() {}
	
	@RequestMapping("/join.do")
	public void join() {}
	
	@RequestMapping("/join02.do")
	public void join02() {}
	
	/*
	@RequestMapping("/login.do")
	public String login(Member m, HttpSession session) {
		Member member = service.login(m);
		// 로그인 실패
		if (member == null) {
			return "redirect:loginform.do";
		}
		// 로그인 성공 시 메인페이지 이동
		session.setAttribute("member", member);
		return "redirect:/main.do";
	}
	*/
	
	@RequestMapping("/login.do")
	public String login(Member m, HttpSession session) {
		Member member = service.login(m);
		// 로그인 실패
		if (member == null) {
			return "redirect:loginform.do";
		}
		// 로그인 성공 시 메인페이지 이동
		session.setAttribute("member", member);
		return "redirect:mypage.do";
	}
}












