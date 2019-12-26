package kr.co.petmee.login.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.petmee.login.service.LoginService;
import kr.co.petmee.repository.vo.User;
import kr.co.petmee.shop.service.ShoppingListService;

@Controller("kr.co.petmee.login.controller.LoginController")
@RequestMapping("/shopping/login")
public class LoginController {
	
	@Autowired
	private ServletContext context;
	@Autowired
	private LoginService service;
	@Autowired
	private ShoppingListService service1;

	// --------------------------------------------------
	// 로그인
	@RequestMapping("/login.do")
	@ResponseBody 
	public String login(User u, HttpSession session) {
		User user = service.login(u);
		int scnt = service1.ShoppingList(user).size();
		// 로그인 실패
		if (user == null) {
			return "f";
		}
		// 로그인 성공 시 메인페이지 이동
		
		user.setShoppingCnt(scnt);
		session.setAttribute("user", user);
		return "s";
	}
	
	// 로그인 ajax
	
	// 로그인 모달
	@RequestMapping("/loginform.do")
	public void loginform() {}
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	
	// --------------------------------------------------
	// 마이페이지 호출
	@RequestMapping("/mypage.do")
	public void mypage(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model,HttpSession session) {
		User user = (User)session.getAttribute("user");
	    model.addAttribute("mypagelist", service.selectMypage(user.getUserNo()));
	    model.addAttribute("user", user);
	}
	
	/*
		 @GetMapping("/mypageUpdateform.do") public void service(int no, Model model)
		 throws Exception { model.addAttribute("mypage", service.updateFormMypage(no)); }
	 */
	
	@PostMapping("/mypageUpdate.do")
	public String update(User user) {
	   service.updateMypage(user);
	   return "redirect:/shopping/login/logout.do";
	}
	
	@RequestMapping("/mypageDelete.do")
	public String delete(int no) {
	   service.deleteMypage(no); 
	   return "redirect:/shopping/login/logout.do";
	}
	
	// --------------------------------------------------
	// 회원가입 약관 불러오기
	@RequestMapping("/join.do")
	public void join() {}
	
	// 회원가입 양식 불러오기
	@RequestMapping("/joinform.do")
	public void join02() {}
	
	// 회원가입 insert
	@RequestMapping("/join02.do")
	public String join02(User user, HttpServletRequest req) {
		service.insertJoin(user);
	    return "redirect:/main.do";
	}

	// 회원가입 이메일 중복검사
	@RequestMapping("/join04.do")
	@ResponseBody 
	public int join04(String user) { // , HttpSession session 
		if(service.emailcheck(user) != null) { return 1; }
		else { return 0; }
	}
	
	
	// --------------------------------------------------
	// 아이디/비번찾기
	@RequestMapping("/find.do")
	public void find() {}
	
	// 이메일 찾기 모달창
	@RequestMapping("/find_id.do")
	public void find_id() {}
	
	// 이메일 모달창 체크
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public String checkEmail(User user) {
		return service.selectfind(user);
	}// , HttpSession session }
	
	// 비밀번호 찾기 모달창
	@RequestMapping("/find_pwd.do")
	public void find_pwd() {}
	
	// 비밀번호 모달창 체크
	@RequestMapping("/checkPass.do")
	@ResponseBody
	public String checkPass(User user) {
		return service.selectpass(user);
	}// , HttpSession session }
	
	
	// 회원가입 완료
	@RequestMapping("/joincom.do")
	public void joincom() {}
}












