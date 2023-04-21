package com.with.community.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.with.community.service.AccountService;
import com.with.community.util.FileUtils;
import com.with.community.vo.AccountVO;

@Controller
@RequestMapping(value ="/account/*")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired(required = false)
	private FileUtils fileUtil;
	
	private final static Logger logger = LoggerFactory.getLogger(AccountController.class);
//	@Autowired
//	@Inject
//	private BCryptPasswordEncoder passEncoder;
	
	@RequestMapping(value="/idChk" , method= RequestMethod.POST)
	public int idChk(AccountVO vo) throws Exception {
		int result = accountService.idChk(vo);
		return result;
	}
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() {
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(AccountVO vo, Model model, HttpSession sesion, RedirectAttributes rttr)throws Exception
	{
		
//		String inputPass = vo.getMe_pwd();
//		String pass = passEncoder.encode(inputPass);
//		vo.setMe_pwd(pass);
		
		int result = accountService.idChk(vo);
		
		try {
			if(result == 1) {
				rttr.addFlashAttribute("msg", "이미 존재하는 아이디입니다. 다시 확인해주세요.");
				return "/account/register";
			}else if(result == 0) {
				String hashedPw = new BCryptPasswordEncoder().encode(vo.getMe_pwd());
				vo.setMe_pwd(hashedPw);
				accountService.register(vo);
				rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다");
			}
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "회원가입 도중 에러가 발생했습니다!");
			logger.error("에러" + e);
		}
//			accountService.register(vo);
//			rttr.addFlashAttribute("msg", "회원가입을 완료하였습니다.");
			
		return "redirect:/home";
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.GET)
	public void loginGET() {
		
	}
	
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST(Model model,AccountVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception
	{
	
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(6000);
			AccountVO login = accountService.login(vo);
			
			if(login == null)  {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호를 다시 한번 확인해주세요!");
				return "redirect:/account/login";
			
			}else if(login.getState().equals("승인대기중")) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", "승인되지 않은 회원입니다. 관리자에게 문의해 주시기 바랍니다.");
				return "redirect:/account/login";
				
			}else {
				session.setAttribute("member", login);
				rttr.addFlashAttribute("msg", "로그인에 성공하였습니다.");
				return "redirect:/home";
			}
	}
	
	@RequestMapping(value = "/logout", method=RequestMethod.GET)
	public String logout(HttpSession session,RedirectAttributes rttr) {
		
		try {
			session.invalidate();
			rttr.addFlashAttribute("msg", "로그아웃을 완료하였습니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "로그아웃에 실패하였습니다.");
			logger.error(" 에러 " + e);
		}
		
		
		return "redirect:/home";
	}
	
	@RequestMapping(value="/profile" , method=RequestMethod.GET)
	public void profileGET() {
		
	}
	
	@RequestMapping(value="/updateImg" , method=RequestMethod.POST)
	public String updateImg(MultipartHttpServletRequest mpRequest, HttpSession session,String me_id)throws Exception {
		
		String me_image = fileUtil.updateImg(mpRequest);
		
		AccountVO accountVO = (AccountVO) session.getAttribute("login");
		
		accountService.updateImg(me_image,me_id);
		
		accountVO.setMe_image(me_image);
		session.setAttribute("login", accountVO);
		
		return "/account/profile";
	}
	
	@RequestMapping(value="/delete" , method=RequestMethod.POST) 
	public String deleteAccount(HttpSession session,HttpServletRequest request, String me_id, RedirectAttributes rttr)
	{
		
		try {
			accountService.deleteAccount(me_id);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/account/login";
	}
	
	@RequestMapping(value="/alram", method=RequestMethod.GET)
	public void AlramGET() {
		
	}
	
	@RequestMapping(value="/IndNotice", method=RequestMethod.GET)
	public void IndNoticeGET() {
		
	}
}
