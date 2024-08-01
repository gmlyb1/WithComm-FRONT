package com.with.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.event.LoggerListener;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.with.community.service.AccountService;
import com.with.community.util.FileUtils;
import com.with.community.vo.AccountVO;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value ="/account/*")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired(required = false)
	private FileUtils fileUtil;
	
	private final static Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private PasswordEncoder passEncoder;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}

	
	@RequestMapping(value="/idChk" , method= RequestMethod.POST)
	@ResponseBody
	public String idChk(@RequestBody String filterJSON,HttpServletResponse response, Model model) throws Exception {
		
		
	AccountVO avo = new AccountVO();
	int idChk = accountService.idChk(avo);
	
	model.addAttribute("idChk", idChk);
		
		return null;
	}
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() {
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(AccountVO vo, Model model, HttpSession sesion, RedirectAttributes rttr)throws Exception
	{
		
		String cryptEncoderPw = passEncoder.encode(vo.getMe_pwd());
		
		vo.setMe_pwd(cryptEncoderPw);
		
		int result = accountService.idChk(vo);

		try {
			if(result == 1) {
				rttr.addFlashAttribute("msg", "이미 존재하는 아이디입니다. 다시 확인해주세요.");
				return "/account/register";
			}else if(result == 0) {
				
				accountService.register(vo);
				rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.\n 관리자의 승인 이후에 서비스 사용이 가능합니다.");
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
			
			if(vo.isUseCookie()) {
				int amount = 60 * 60 * 24 * 7;
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
				accountService.keepLogin(null, null, sessionLimit);
			}
			
			if(login == null)  {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호를 다시 한번 확인해주세요!");
				return "redirect:/account/login";
			
			}else if(login.getState().equals("승인대기중")) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", "승인되지 않은 회원입니다.\n 관리자에게 문의해 주시기 바랍니다.");
				return "redirect:/account/login";
			
			}else if(login.getState().equals("활동중지")) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", "본 아이디는 관리자에 의해 중지된 아이디입니다.");
				return "redirect:/account/login";
				
			}else {
				session.setAttribute("member", login);
	            rttr.addFlashAttribute("msg", "로그인에 성공하였습니다.");
				
				return "redirect:/home";
				
		    }
			
	}
	
//	//암호화 로직 테스트중
//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public String loginPOST(Model model, AccountVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
//	    HttpSession session = request.getSession();
//	    session.setMaxInactiveInterval(6000);
//
//	    try {
//	        // 사용자 입력 데이터 로깅
//	        logger.info("사용자 입력 아이디: {}", vo.getMe_id());
//
//	        // 서비스 계층에서 로그인 처리
//	        AccountVO login = accountService.login(vo);
//
//	        if (login == null) {
//	            session.setAttribute("member", null);
//	            rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호를 다시 한번 확인해주세요!");
//	            return "redirect:/account/login";
//	        }
//
//	        logger.info("로그인 성공 - 사용자 정보: {}", login);
//
//	        String inputPassword = vo.getMe_pwd();
//	        String encryptedPasswordFromDB = login.getMe_pwd();
//	        
//	        
//	        Boolean result = passEncoder.matches(inputPassword, encryptedPasswordFromDB);
//	        System.out.println("matchpwd:" + result);
//	        // 입력된 비밀번호와 데이터베이스에서 조회한 암호화된 비밀번호 비교
//	        if (result) {
//	        	vo.setMe_pwd(encryptedPasswordFromDB);
//	            session.setAttribute("member", login);
//	            rttr.addFlashAttribute("msg", "로그인에 성공하였습니다.");
//	        } else {
//	            session.setAttribute("member", null);
//	            rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호를 다시 한번 확인해주세요!");
//	            return "redirect:/account/login";
//	        }
//
//	        return "redirect:/home";
//	    } catch (Exception e) {
//	        logger.error("로그인 처리 중 오류 발생", e);
//	        rttr.addFlashAttribute("msg", "로그인 도중 오류가 발생했습니다. 관리자에게 문의하세요.");
//	        return "redirect:/account/login";
//	    }
//	}


	
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
	
	@RequestMapping(value="/imageUdt" , method=RequestMethod.POST)
	public String profileUdt(MultipartHttpServletRequest multiRequest, Model model) throws Exception
	{
		logger.info("실행");
		
		logger.info("기존파일 : " + multiRequest.getParameter("default_file"));
		
		String me_image = "";
		
		MultipartFile file = multiRequest.getFile("me_image");
		
		if(file.getOriginalFilename() == "") {
			logger.info("기존 파일에 넣기");
			me_image = multiRequest.getParameter("default_file");
			
			logger.info("me_image : " + me_image);
		} else {
			logger.info("변경 파일에 넣기");
			
			String file_path = multiRequest.getSession().getServletContext().getRealPath("/resources/assets/upload/mem_Image");
			
			String uuid = UUID.randomUUID().toString();
			
			me_image = uuid + "_" + file.getOriginalFilename();
			
			file.transferTo(new File(file_path + "/" + me_image));
			
			File f = new File(file_path + "/" + multiRequest.getParameter("default_file"));
			
			logger.info("f: " + f);
			
			if(f.exists()) {
				f.delete();
			}
		}
		
		AccountVO avo = new AccountVO();
		
		avo.setMe_id(Integer.parseInt((String)multiRequest.getParameter("me_id")));
		avo.setMe_image(me_image);
		
		System.out.println(" C : 파라미터 값" + avo);
		
		int result = accountService.imageUdt(avo);
		
		logger.info("result : " + result);
		model.addAttribute("updateAcc_result", result);
		
		return "redirect:/account/profile";
		
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
	
	//비밀번호 변경 GET
	@RequestMapping(value="/pwdUdt", method= RequestMethod.GET)
	public void pwdUpdate(AccountVO vo) {
		
	}
	
	//비밀번호 변경
	@RequestMapping(value="/profileUdt", method= RequestMethod.POST)
	public String pwdUpdatePOST(AccountVO vo) throws Exception {

		accountService.profileUdt(vo);
		
		
		return "redirect:/account/profile";
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="/forgotPass" , method=RequestMethod.GET)
	public String forgotPassPage() {
		return "/account/forgotPass";
	}
	
	
}
