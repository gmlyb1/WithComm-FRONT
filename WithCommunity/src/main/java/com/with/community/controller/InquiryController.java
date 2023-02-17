package com.with.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.with.community.service.InquiryService;
import com.with.community.vo.BoardVO;
import com.with.community.vo.InquiryVO;
import com.with.community.vo.ReplyVO;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping(value="/list" , method=RequestMethod.GET)
	public String inquiryGET(InquiryVO vo, Model model) throws Exception {
		
		// 1:1 문의 리스트
			List<InquiryVO> inquiryList = inquiryService.selectInquiryList();
			model.addAttribute("inquiryList", inquiryList);
			model.addAttribute("inquiry", vo.getInq_name());
			
		return "/inquiry/list";
	}
	
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public String BoardRead(
			/* @ModelAttribute("scri") SearchCriteria scri, */@RequestParam("inq_no") int inq_no,InquiryVO vo, Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {

		
//		boardService.updateReplyCount(board_no);
		model.addAttribute("read", inquiryService.selectInquiryDetail(inq_no));
		
//		List<ReplyVO> replyList = replyService.replyList(vo.getBoard_no());
//		model.addAttribute("replyList", replyList);
		
		// 이전글
//		model.addAttribute("lastBoardList", boardService.lastBoardList(board_no));
		// 다음글
//		model.addAttribute("nextBoardList", boardService.nextBoardList(board_no));
		
//		System.out.println(vo.getBoard_no());
		
		return "/inquiry/detail";
	}
	
	
}
