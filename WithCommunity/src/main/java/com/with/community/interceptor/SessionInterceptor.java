package com.with.community.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.with.community.vo.AccountVO;

public class SessionInterceptor implements HandlerInterceptor{

	 @Override
	 public boolean preHandle(HttpServletRequest request,
	    HttpServletResponse response, Object obj) throws Exception {
		 
		 response.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html; charset=UTF-8");
		 
		 HttpSession session = request.getSession();
		 AccountVO member = (AccountVO)session.getAttribute("member");
		 PrintWriter out = response.getWriter();
		 
		 if(member.getAdminCk() != 1 || member == null ) {
			 out.println("<script>alert('권한이 없습니다.'); history.go(-1);</script>");
			 out.flush(); 
			 response.sendRedirect("/home");
			 return false;
		 }
		 return true;
		 
	 }
	 
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
		
}
