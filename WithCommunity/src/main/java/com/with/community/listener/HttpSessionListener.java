package com.with.community.listener;


import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.with.community.service.AccountService;
import com.with.community.service.VisitCountService;
import com.with.community.vo.AccountVO;
import com.with.community.vo.VisitCountVO;

@WebListener
public class HttpSessionListener implements javax.servlet.http.HttpSessionListener{

	@Autowired
	private AccountService accountService;
	
	private static int todayVisitCount;
	
	public static int getTodayVisitCount() {
		return todayVisitCount;
	}
	
	public static void setTodayVisitCount(int count) {
		todayVisitCount = count;
	}

	private HttpServletRequest request;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		String hostAddr = "";
		try {
			hostAddr = InetAddress.getLocalHost().getHostAddress();
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		VisitCountService visitCountService = ctx.getBean("VisitCountService",VisitCountService.class);
		
		VisitCountVO vvo = new VisitCountVO();
		
			if(session.isNew()) {
				
				vvo = visitCountService.selectVisitCount(vvo);
				if(vvo != null) {
					vvo.setVisit_ip(hostAddr);
				
					visitCountService.insertVisitCount(vvo);
					setTodayVisitCount(1);
				} else {
					visitCountService.updateVisitCount(vvo);
					setTodayVisitCount(vvo.getVisitCount() + 1);
				}
			}
		
	}
	

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
