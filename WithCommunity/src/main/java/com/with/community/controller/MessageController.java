package com.with.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.with.community.dao.MessageDAO;
import com.with.community.service.MessageService;
import com.with.community.vo.MessageVO;

@Controller
@RequestMapping("/message/*")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping(value = "/list" , method = {RequestMethod.GET, RequestMethod.POST})
	public String MessageList(HttpServletRequest request, HttpSession session,Model model) throws Exception
	{
		String nick = (String) session.getAttribute("nick");
		
		MessageVO vo = new MessageVO();
		vo.setNick(nick);
		
		//메시지 리스트
		ArrayList<MessageVO> list = messageService.selectMessageList(vo);
		model.addAttribute("list", list);
		
		
		return "/message/list";
	}
	
	@RequestMapping(value = "/message_content_list", method = RequestMethod.POST)
	public String msgContentList(HttpServletRequest request, HttpSession session,Model model)throws Exception
	{
		int room = Integer.parseInt(request.getParameter("msg_room"));
		
		MessageVO vo = new MessageVO();
		vo.setMsg_room(room);
		vo.setNick((String) session.getAttribute("nick"));
		
		ArrayList<MessageVO> cList = messageService.selectRoomContentList(vo);
		
		model.addAttribute("cList", cList);
	
		return "/message/message_cotent_list";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist")
	public int message_send_inlist(@RequestParam int msg_room, @RequestParam String other_nick, @RequestParam String msg_content, HttpSession session) throws Exception
	{
		MessageVO vo = new MessageVO();
		vo.setMsg_room(msg_room);
		vo.setSend_nick((String) session.getAttribute("nick"));
		vo.setRecv_nick(other_nick);
		vo.setMsg_content(msg_content);
		
		int flag = messageService.selectMessageSendInList(vo);
		
		return flag;
	}
}
