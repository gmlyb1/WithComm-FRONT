package com.with.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.with.community.service.InquiryService;
import com.with.community.vo.AccountVO;
import com.with.community.vo.BoardVO;
import com.with.community.vo.Criteria;
import com.with.community.vo.InquiryVO;
import com.with.community.vo.PageMaker;
import com.with.community.vo.ReplyVO;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
	
	@RequestMapping(value="/list" ,method = {RequestMethod.GET, RequestMethod.POST})
	public String inquiryGET(InquiryVO vo, Model model, Criteria cri) throws Exception {
		
		
		// 1:1 문의 리스트
		List<InquiryVO> inquiryList = inquiryService.selectInquiryList(cri);
		int totCnt = inquiryService.selectInqCnt(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totCnt);
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("inquiry", vo.getInq_name());
			
		return "/inquiry/list";
	}

	@RequestMapping(value = "/create", method=RequestMethod.GET) 
	public void MakeInquiryPage() {
		
	}
	
	@RequestMapping(value="/create" , method=RequestMethod.POST)
	public String insertInquiry(InquiryVO vo, HttpServletRequest request, RedirectAttributes rttr,AccountVO aVO) {
			
		try {
//			vo.setInq_name(aVO.getMe_name());
			inquiryService.insertInquiry(vo);
			rttr.addFlashAttribute("msg", "글 작성을 완료하였습니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "에러가 발생했습니다.");
			logger.error("오류 :" + e);
		}
		
		return "redirect:/inquiry/list";
	}
	
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public String InquiryRead(
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
