package com.with.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.with.community.service.AccountService;
import com.with.community.service.MessageService;
import com.with.community.vo.AccountVO;
import com.with.community.vo.Criteria;
import com.with.community.vo.MessageVO;

@Controller
@RequestMapping(value ="/message/*")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private AccountService accountService;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping(value = "/list", method= {RequestMethod.GET,RequestMethod.POST})
	public String MessageList(@ModelAttribute("messageVO") MessageVO messageVO, HttpServletRequest request, HttpServletResponse response, Model model,Criteria cri) throws Exception{
		
		List<MessageVO> messageList = messageService.selectMessageList(messageVO);
		model.addAttribute("messageList", messageList);
		return "/message/list";
	}
	
	@RequestMapping(value = "/sendMsg", method=RequestMethod.POST)
	public String sendMsg(RedirectAttributes rttr,@RequestParam String flag, @ModelAttribute("messageVO")MessageVO messageVO,HttpServletRequest request)throws Exception{
		try {
			messageService.sendMessage(messageVO);
			rttr.addFlashAttribute("msg", "메세지 보내기를 성공하였습니다.");
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:/home";
	}
	
	@RequestMapping(value="/detail" , method=RequestMethod.GET)
	public void sendMsgListDetailGET() throws Exception {
		
	}
	
	@RequestMapping(value="/detail" , method=RequestMethod.POST)
	public String sendMsgListDetailPOST() throws Exception {
		
		
		return "/message/detail";
	}

}
