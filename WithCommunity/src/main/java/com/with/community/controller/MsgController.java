package com.with.community.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.with.community.dao.MsgDAO;
import com.with.community.vo.MessageVO;

@Controller
@RequestMapping("/msg/*")
public class MsgController {

	@Autowired
	private MsgDAO msgDAO;
	
	@RequestMapping(value = "/message_list" , method = {RequestMethod.GET,RequestMethod.POST})
	public String messageList(HttpServletRequest request, HttpSession session, Model model) throws Exception 
	{
		String nick = (String) session.getAttribute("nick");
		MessageVO vo = new MessageVO();
		vo.setNick(nick);
		
		ArrayList<MessageVO> list = msgDAO.messageList(vo);
		
		request.setAttribute("list", list);
		
		return "/msg/message_list";
	}
	
	
	@RequestMapping(value = "/msg_content_list" , method = RequestMethod.POST)
	public String msg_content_list(HttpServletRequest request, HttpSession session, Model model) throws Exception
	{
		int room = Integer.parseInt(request.getParameter("room"));
		
		MessageVO vo = new MessageVO();
		
		vo.setMsg_room(room);
		vo.setNick((String) session.getAttribute("nick"));
		
		ArrayList<MessageVO> cList = msgDAO.roomContentList(vo);
		
		request.setAttribute("cList", cList);
		
		return "/msg/msg_content_list";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/msg_send_inlist", method = RequestMethod.POST)
	public int msg_send_inlist(@RequestParam int msg_room, @RequestParam String other_nick, @RequestParam String msg_content, HttpSession session ) throws Exception
	{
		MessageVO vo = new MessageVO();
		vo.setMsg_room(msg_room);
		vo.setSend_nick((String) session.getAttribute("nick"));
		vo.setRecv_nick(other_nick);
		vo.setMsg_content(msg_content);
		
		int flag = msgDAO.messageSendInlist(vo);
		
		return flag;
	}
	
	
}
