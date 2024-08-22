package com.with.community.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.with.community.service.AccountService;
import com.with.community.vo.AccountVO;


public class RememberMeInterceptor implements HandlerInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(RememberMeInterceptor.class);
	
	@Inject
	private AccountService accountService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		AccountVO avo;
		
		if(obj == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			logger.info("loginCookie:" + loginCookie);
			if(loginCookie != null) {
				String sessionId = loginCookie.getValue();
				logger.info(sessionId);
				avo = accountService.checkUserWithSessionKey(sessionId);
				if(avo != null) {
					session.setAttribute("member", avo);
					logger.info("자동 로그인 합니다");
					return true;
				}
			}
			
			response.sendRedirect("/account/login");
			logger.info("Interceptor 후 로그인");
			return false;
		}
		
		logger.info("interceptor 통과");
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
