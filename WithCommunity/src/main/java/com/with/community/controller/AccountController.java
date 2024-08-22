package com.with.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
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
	
	private final FileUtils fileUtil = new FileUtils();
	
	private final static Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private PasswordEncoder passEncoder;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}

	
	
	 @RequestMapping(value="/idChk", method=RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> idChk(
            @RequestParam("me_email") String me_email) throws Exception {

        Map<String, Object> response = new HashMap<>();

        try {
            AccountVO aVO = new AccountVO();
            aVO.setMe_email(me_email);

            AccountVO idChk = accountService.idChk(aVO);

            if (idChk != null && idChk.getMe_email() != null) {
                response.put("result", 1); // Email already exists
                response.put("msg", "이미 존재하는 아이디 입니다.");
            } else {
                response.put("result", 0); // Email available
                response.put("msg", "사용 가능한 아이디 입니다.");
            }
        } catch (Exception e) {
            response.put("result", -1); // Error occurred
            response.put("msg", "서버 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() {
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(AccountVO vo, Model model, HttpSession session, RedirectAttributes rttr)throws Exception
	{
		try {
			accountService.register(vo);
			rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.\n 관리자의 승인 이후에 서비스 사용이 가능합니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "회원가입 도중 에러가 발생했습니다!");
			logger.error("에러" + e);
		}
			
		return "redirect:/home";
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.GET)
	public void loginGET() {
		
	}
	
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST(HttpSession session,Model model,AccountVO vo, HttpServletRequest request, HttpServletResponse response,RedirectAttributes rttr) throws Exception
	{
//		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(6000);
		
		AccountVO login = accountService.login(vo);
//		System.out.println(vo.isUseCookie());
		
		if(login == null)  {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호를 다시 한번 확인해주세요!");
			return "redirect:/account/login";
		}else if(login.getState().equals("승인대기중")) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "승인되지 않은 회원입니다.");
			return "redirect:/account/login";
		
		}else if(login.getState().equals("활동중지")) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "본 아이디는 관리자에 의해 중지된 아이디입니다.");
			return "redirect:/account/login";
			
		}else{
			
			session.setAttribute("member", login);
	        rttr.addFlashAttribute("msg", "로그인에 성공하였습니다.");
			return "redirect:/home";
		}
	}
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String loginPOST(HttpSession session, Model model, AccountVO vo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
//	    String returnURL = "";
//
//	    session.setMaxInactiveInterval(6000);
//
//	    AccountVO login = accountService.login(vo);
//	    System.out.println(vo.isUseCookie());
//
//	    if (login == null) {
//	        session.setAttribute("member", null);
//	        rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호를 다시 한번 확인해주세요!");
//	        return "redirect:/account/login";
//	    } else if (login.getState().equals("승인대기중")) {
//	        session.setAttribute("member", null);
//	        rttr.addFlashAttribute("msg", "승인되지 않은 회원입니다.\n 관리자에게 문의해 주시기 바랍니다.");
//	        return "redirect:/account/login";
//	    } else if (login.getState().equals("활동중지")) {
//	        session.setAttribute("member", null);
//	        rttr.addFlashAttribute("msg", "본 아이디는 관리자에 의해 중지된 아이디입니다.");
//	        return "redirect:/account/login";
//	    } else {
//	        // Successful login
//	        session.setAttribute("member", login);
//	        logger.info("로그인 성공");
//	        returnURL = "redirect:/home"; // Corrected typo
//
//	        if (vo.isUseCookie()) {
//	            Cookie loginCookie = new Cookie("loginCookie", session.getId());
//	            int amount = 60 * 60 * 24 * 1; // 1 day
//	            loginCookie.setPath("/");
//	            loginCookie.setMaxAge(amount);
//
//	            response.addCookie(loginCookie);
//	            logger.info("Cookie 자동 로그인 체크 완료: " + loginCookie);
//
//	            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
//	            accountService.keepLogin(vo.getMe_id(), session.getId(), sessionLimit);
//	        } else {
//	            model.addAttribute("msg", "로그인에 실패하였습니다.");
//	            logger.info("로그인 실패");
//	            return "redirect:/account/login";
//	        }
//
//	        return returnURL;
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
	
	@RequestMapping(value="/updateImg" , method=RequestMethod.POST)
	public String profileUdt(HttpSession session,MultipartHttpServletRequest multiRequest, Model model,String me_id) throws Exception
	{
		
		logger.info("this.filUtil :" +this.fileUtil);
		String me_image = fileUtil.updateImg(multiRequest);
		
		
		AccountVO accountVO = (AccountVO) session.getAttribute("member");
		
		MultipartFile file = multiRequest.getFile(me_image);
		
		System.out.println("파일값: " + file.getOriginalFilename());
		
		String filePath = multiRequest.getSession().getServletContext().getRealPath("/resources/upload/mem_Image");
		
		if(file.getOriginalFilename() != "") {
			String uuid = UUID.randomUUID().toString();
			
			String fileNewName = uuid + "_" + file.getOriginalFilename();
			file.transferTo(new File(filePath + "/" + fileNewName));
			
			System.out.println("파일 업로드 완료!");
			
			accountVO.setMe_image(fileNewName);
		}
		
		accountService.updateImg(me_image,me_id);
		session.setAttribute("member", accountVO);
			
		
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
	@RequestMapping(value="/profileUdt", method= RequestMethod.GET)
	public void pwdUpdate(AccountVO vo) {
		
	}
	
	//비밀번호 변경
	@RequestMapping(value="/profileUdt",method= RequestMethod.POST)
	public String pwdUpdatePOST(AccountVO vo,
			RedirectAttributes rttr/* ,MultipartHttpServletRequest multiRequest */) throws Exception {
		
		try {
//			String me_image = "";
//			
//			MultipartFile file = multiRequest.getFile("me_image");
//			
//			if(file.getOriginalFilename() == "") {
//				System.out.print("11 : 기존파일이 넣기");
//				me_image = multiRequest.getParameter("default_file");
//			}else {
//				System.out.print("11 : 변경파일이 넣기");
//				
//				String filePath = multiRequest.getSession().getServletContext().getRealPath("/resources/upload/mem_Image");
//				
//				String uuid = UUID.randomUUID().toString();
//				
//				me_image = uuid + "_" + file.getOriginalFilename();
//				
//				file.transferTo(new File(filePath + "/" + me_image));
//				
//				File f = new File(filePath + "/" + multiRequest.getParameter("default_file"));
//				
//				if(f.exists()) {
//					f.delete();
//				}
//			}
//			
			vo.setMe_pwd(vo.getMe_pwd());
			vo.setMe_name(vo.getMe_name());
//			vo.setMe_image(me_image);
			
			accountService.profileUdt(vo);
			rttr.addFlashAttribute("msg", "회원 정보 변경에 성공하였습니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "에러가 발생하였습니다.");
			e.printStackTrace();
		}
		
		return "redirect:/account/profile";
	}
	
	//아이디 찾기 페이지
	@RequestMapping(value="/forgotId" , method=RequestMethod.GET)
	public void forgotIdPage() {
		
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="/forgotId" , method=RequestMethod.POST)
	public String forgotId(HttpServletRequest request, Model model,
		    @RequestParam(required = true, value = "me_real_name") String me_real_name, 
		    @RequestParam(required = true, value = "me_phone") String me_phone,
		    AccountVO aVO,RedirectAttributes rttr) throws Exception{
		
		try {
			aVO.setMe_real_name(me_real_name);
			aVO.setMe_phone(me_phone);

			AccountVO memberSearch = accountService.memberIdSearch(aVO);
			
			if(memberSearch == null) {
				rttr.addFlashAttribute("msg", "정보가 일치하지 않습니다");
			}else {
				model.addAttribute("aVO", memberSearch);
				rttr.addFlashAttribute("msg", "회원님의 아이디는" + memberSearch.getMe_email() + "입니다.");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "에러가 발생했습니다");
		}
		
		return "redirect:/account/forgotId";
	}
	
	//	비밀번호 찾기 페이지
	@RequestMapping(value="/forgotPass" , method=RequestMethod.GET)
	public void forgotPassPage() {
	}
	
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="/forgotPass" , method= RequestMethod.POST)
	public String forgotPass(HttpServletRequest request, Model model, RedirectAttributes rttr,
		    @RequestParam(required = true, value = "me_email") String me_email, 
		    @RequestParam(required = true, value = "me_phone") String me_phone, 
		    AccountVO aVO) throws Exception{
		
	try {
		aVO.setMe_email(me_email);
		aVO.setMe_phone(me_phone);
		int memberSearch = accountService.memberPwdCheck(aVO);
		
		if(memberSearch == 0) {
			
			rttr.addFlashAttribute("msg", "가입된 정보가 잘못되었습니다 다시 입력해 주세요!"  );
			return "redirect:/account/forgotPass";
		} else if(memberSearch == 1) {
			String newPwd = RandomStringUtils.randomAlphanumeric(10);
			
			aVO.setMe_pwd(newPwd);
			
			accountService.passwordUpdate(aVO);
			rttr.addFlashAttribute("msg", "비밀번호 초기화! 초기화 된 비밀번호: "+newPwd );
			model.addAttribute("newPwd", newPwd);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		rttr.addFlashAttribute("msg", "에러가 발생했습니다.");
	}
		return "redirect:/account/forgotPass";
	}
	
	@RequestMapping(value="/IndNotice" , method=RequestMethod.GET)
	public String indNotice() throws Exception {
		return "/account/IndNotice";
	}
	
	@RequestMapping(value="/alram" , method=RequestMethod.GET)
	public String alarm() throws Exception {
		return "/account/alram";
	}
	
}
