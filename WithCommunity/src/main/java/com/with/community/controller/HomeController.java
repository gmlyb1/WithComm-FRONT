package com.with.community.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.with.community.service.AccountService;
import com.with.community.service.BoardService;
import com.with.community.service.NoticeService;
import com.with.community.vo.AccountVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private AccountService accountService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model,AccountVO vo) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("HomeNoticeList", noticeService.HomeNoticeList());
		model.addAttribute("HomeBoardList", boardService.HomeBoardList());
		model.addAttribute("HomeMemberList", accountService.selectHomeList(vo));
		
		
		return "home";
	}
	

	
}
