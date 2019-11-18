package kr.co.petmee.common;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.petmee.repository.vo.User;;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user != null) {
			return true;
		}
		System.out.println("인터셉터에서 로그인 인증 걸림");
		response.sendRedirect("/22_springboard/login/loginform.do");
		return false;
	}

}
