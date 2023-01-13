package com.with.community.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.with.community.vo.AccountVO;

public class SessionInterceptor extends HandlerInterceptorAdapter{

	 @Override
	 public boolean preHandle(HttpServletRequest request,
	    HttpServletResponse response, Object obj) throws Exception {
		 
		 HttpSession session = request.getSession();
		 AccountVO member = (AccountVO)session.getAttribute("member");
		 
		 if(member == null) {
			 response.sendRedirect("/home");
			 return false;
		 }
		 
		 return true;
	 }
	
	
		
}
