package com.with.community.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.with.community.service.ReplyService;
import com.with.community.vo.BoardVO;
import com.with.community.vo.ReplyVO;


@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	private ReplyService replyService;
	
	// ¥Ò±€ ¿€º∫
		@RequestMapping(value = "/write", method=RequestMethod.POST)
		public String postWrite(ReplyVO vo,BoardVO bvo) throws Exception {
			
			 replyService.replyWrite(vo);
			
			 
			return "redirect:/board/read?board_no="+bvo.getBoard_no();
		}
		
		// ¥Ò±€ ªË¡¶
		@RequestMapping(value="/delete" , method=RequestMethod.GET)
		public String removeReply(@RequestParam("reply_no")int reply_no, @RequestParam("board_no")int board_no, BoardVO bvo, ReplyVO rvo) throws Exception 
		{
			
			replyService.replyDelete(reply_no);
			
			return "redirect:/board/read?board_no="+bvo.getBoard_no();
		}
}
