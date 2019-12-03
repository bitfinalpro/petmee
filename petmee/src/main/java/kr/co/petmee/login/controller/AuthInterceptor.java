package kr.co.petmee.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.petmee.repository.vo.Member;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 인증이 필요한곳에서 인증이 됬나안됬나를 본다.
		
		HttpSession session = request.getSession(); // 여기에 오면 무조건 로그인을 해야함
		Member member = (Member)session.getAttribute("user");
		
		if (member != null) {
			return true; // 원페이지 요청을 계속하라.
		}
		// 세션이 없으면 어디로 이동?
		// 로그인 폼으로 이동시킨다.
		System.out.println("인터셉터에서 로그인 인증에 걸림..");
		
		response.sendRedirect("loginform.do");
		return false;
	}
	
}
