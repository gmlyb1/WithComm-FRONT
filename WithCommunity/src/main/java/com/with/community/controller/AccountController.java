package com.with.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.with.community.service.AccountService;
import com.with.community.vo.AccountVO;

@Controller
@RequestMapping(value ="/account/*")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/login" , method=RequestMethod.GET)
	public void loginGET() {
		
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST(AccountVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception
	{
	
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(6000);
			AccountVO login = accountService.login(vo);
			
			if(login == null)  {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", "아이디와 비밀번호를 다시 확인하세요!");
				return "redirect:/account/login";
			} else {
				session.setAttribute("member", login);
				rttr.addFlashAttribute("msg", "로그인에 성공하였습니다.");
				return "redirect:/home";
	}
}
	
	@RequestMapping(value = "/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/home";
	}
}
