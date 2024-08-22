package com.with.community.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
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
		 
		 if(member == null) {
			 out.println("<script>alert('로그인이 필요합니다.'); history.go(-1);</script>");
			 out.flush(); 
			 return false;
		 }
		 return true;
		 
	 }
	 
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object AccountVO = modelMap.get("member");
		
		if(AccountVO != null) {
			httpSession.setAttribute("LOGIN", AccountVO);
			if(request.getParameter("useCookie") !=null) {
				Cookie loginCookie = new Cookie("loginCookie",httpSession.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
			}
			
			Object destination = httpSession.getAttribute("destination");
			Object URL = httpSession.getAttribute("URL");
			response.sendRedirect(destination != null? (String) destination : (String)URL);
			
		}
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
		
}
