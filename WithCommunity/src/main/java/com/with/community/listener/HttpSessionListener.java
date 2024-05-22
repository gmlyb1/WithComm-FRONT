package com.with.community.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.with.community.service.VisitCountService;
import com.with.community.vo.VisitCountVO;

@WebListener
public class HttpSessionListener implements javax.servlet.http.HttpSessionListener{

	private static int todayVisitCount;
	
	public static int getTodayVisitCount() {
		return todayVisitCount;
	}
	
	public static void setTodayVisitCount(int count) {
		todayVisitCount = count;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		VisitCountService visitCountService = ctx.getBean("VisitCountService",VisitCountService.class);
		
		VisitCountVO vvo = new VisitCountVO();
		
		if(session.isNew()) {
			VisitCountVO visitCountVO = visitCountService.selectVisitCount(vvo);
			if(visitCountVO == null) {
				visitCountService.insertVisitCount();
				setTodayVisitCount(1);
			} else {
				visitCountService.updateVisitCount();
				setTodayVisitCount(visitCountVO.getVisitCount() + 1);
			}
		}
	
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
