package com.with.community.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.with.community.service.ReplyService;
import com.with.community.vo.BoardVO;
import com.with.community.vo.ReplyVO;


@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	private ReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	// 댓글 작성
	@RequestMapping(value = "/write", method=RequestMethod.POST)
	public String postWrite(ReplyVO vo,BoardVO bvo,RedirectAttributes rttr) throws Exception {
		
		try {
			replyService.replyWrite(vo);
			rttr.addFlashAttribute("msg", "댓글작성을 완료하였습니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "오류가 발생하였습니다.");
			logger.error("오류 : " + e);
		}
		
		 
		return "redirect:/board/read?board_no="+bvo.getBoard_no();
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String replyUpdateGET(BoardVO bvo, Model model)throws Exception  {
		
		model.addAttribute("rUpdate", replyService.replyList(bvo.getBoard_no()));
		
		return "/reply/update";
	}
	
	// 댓글 수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String replyUpdate(ReplyVO rvo,BoardVO bvo,RedirectAttributes rttr,Model model) throws Exception {
		
		List<ReplyVO> replyList = replyService.replyList(bvo.getBoard_no());
		model.addAttribute("replyList", replyList);
		
		try {
			replyService.replyUpdate(bvo);
			rttr.addFlashAttribute("msg", "댓글 수정을 완료하였습니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "오류가 발생하였습니다.");
		}
		
		
		return "redirect:/board/read?board_no="+bvo.getBoard_no();
	}
		
		// 댓글 수정 - 버튼클릭
		@RequestMapping(value="/modify", method=RequestMethod.POST) 
		public String modifyReply(@RequestParam("reply_no")int reply_no, @RequestParam("board_no")int board_no, RedirectAttributes rttr,BoardVO bvo, ReplyVO rvo,@RequestParam("edited_content")String edited_content) throws Exception {
			try {
				// 댓글 수정 성공시
				replyService.modifyReply(reply_no,edited_content);
				rttr.addFlashAttribute("msg", "댓글 수정을 성공하였습니다.");
				
			} catch (Exception e) {
				rttr.addFlashAttribute("msg", "에러가 발생하였습니다.");
				logger.error("오류 : " + e);
			}
			
			return "redirect:/board/read?board_no="+bvo.getBoard_no();
		}
	
		// 댓글 삭제
		@RequestMapping(value="/delete" , method=RequestMethod.GET)
		public String removeReply(@RequestParam("reply_no")int reply_no, @RequestParam("board_no")int board_no, BoardVO bvo, ReplyVO rvo,RedirectAttributes rttr) throws Exception 
		{
			try {
				replyService.replyDelete(reply_no);
				rttr.addFlashAttribute("msg", "댓글 삭제를 완료하였습니다.");
			} catch (Exception e) {
				rttr.addFlashAttribute("msg", "오류가 발생하였습니다.");
				logger.error("오류 : " + e);
			}
			
			return "redirect:/board/read?board_no="+bvo.getBoard_no();
		}
}
