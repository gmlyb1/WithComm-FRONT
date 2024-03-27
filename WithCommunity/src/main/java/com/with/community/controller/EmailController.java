package com.with.community.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.with.community.service.EmailService;
import com.with.community.vo.AccountVO;
import com.with.community.vo.MailVO;

@Controller
@RequestMapping("/mail/*")
public class EmailController {

	@Inject
	private EmailService emailService;
		
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@RequestMapping(value = "/recevMail" , method = RequestMethod.GET)
	public void recevMailGET(Model model, HttpSession session) throws Exception
	{
		// 받은 메일
		AccountVO avo = (AccountVO)session.getAttribute("member");
		
		// 수신 메일 list 
		model.addAttribute("mailList", emailService.mailList(avo.getMe_email()));
	}
	
	@RequestMapping(value = "/recevRead" , method = RequestMethod.GET)
	public void readDetail_RecMail(@RequestParam("mail_num") int mail_num, Model model) throws Exception
	{
		
		MailVO mVO = emailService.recevRead(mail_num);
		String recName = emailService.mailName(mVO.getMail_id());
		String sendName = emailService.mailName(mVO.getMail_email());
		
		model.addAttribute("recevReadDetail", mVO);
		model.addAttribute("recName", recName);
		model.addAttribute("sendName", sendName);
		
		
	}


}


