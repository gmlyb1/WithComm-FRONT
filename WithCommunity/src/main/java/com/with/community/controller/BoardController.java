package com.with.community.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.with.community.service.BoardService;
import com.with.community.service.ReplyService;
import com.with.community.vo.BoardVO;
import com.with.community.vo.Criteria;
import com.with.community.vo.PageMaker;
import com.with.community.vo.ReplyVO;


@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	@Inject
	private BoardService boardService;
	
	@Inject
	private ReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
		//목록
		@RequestMapping(value = "/list", method= {RequestMethod.GET, RequestMethod.POST})
		public String BoardList(@ModelAttribute("vo") BoardVO vo,HttpServletRequest request,Model model,Criteria cri) throws Exception 
		{
			Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
			
			if(null != inputFlashMap) {
				model.addAttribute("msg", (String)inputFlashMap.get("msg"));
			}
			
			//리스트 받아서 바인딩.
			List<BoardVO> boardList = boardService.BoardList(cri);
			int totCnt = boardService.getListCount(cri);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(boardService.getListCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("boardList", boardList);
			
			return "/board/list";
		}
		
		//글쓰기
		@RequestMapping(value = "/create", method= RequestMethod.GET)
		public void insertBoardGET() {
		}
		
		//글쓰기(POST)
		@RequestMapping(value= "/create" , method = RequestMethod.POST)
		public String insertBoardPOST(@ModelAttribute("vo") BoardVO vo,HttpServletRequest request ,RedirectAttributes redirect) throws Exception 
		{
			
		try {
//			SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd");
//			
//			Date time = new Date();
//			
//			String time1 = format1.format(time);
//			vo.setBoard_regdate(time1);
			
			boardService.insertBoard(vo);
			
			redirect.addFlashAttribute("redirect", vo.getBoard_no());
			redirect.addFlashAttribute("msg", "글 작성을 완료하였습니다.");
			
		} catch (Exception e) {
				redirect.addFlashAttribute("msg", "오류가 발생하였습니다.");
				logger.error("오류 :" + e);
		}
			
			return "redirect:/board/list";
	}
		
		@RequestMapping(value = "/read", method=RequestMethod.GET)
		public String BoardRead(
				/* @ModelAttribute("scri") SearchCriteria scri, */@RequestParam("board_no") int board_no,BoardVO vo, Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			String boardKey = "board_" + board_no;
			
			Long lastViewTime = (Long) session.getAttribute(boardKey);
			Long currentTime =  System.currentTimeMillis();
			
//			logger.info("board_key: " + boardKey );
//			logger.info("lastViewTime: " + lastViewTime );
//			logger.info("currentTime: " + currentTime );
			
			
//			if(lastViewTime == null || (currentTime - lastViewTime) >= 36000000) {
//				logger.info("들어오나");
//				boardService.updateReplyCount(board_no);
//				
//				session.setAttribute(boardKey, currentTime);
//				Cookie boardCookie = new Cookie("boardCookie", boardKey);
//				boardCookie.setMaxAge(3600);
//				response.addCookie(boardCookie);
//			}
			
			boardService.updateReplyCount(board_no);
			model.addAttribute("read", boardService.BoardRead(board_no));
			List<ReplyVO> replyList = replyService.replyList(vo.getBoard_no());
			model.addAttribute("replyList", replyList);
			// 이전글
			model.addAttribute("lastBoardList", boardService.lastBoardList(board_no));
			
			// 다음글
			model.addAttribute("nextBoardList", boardService.nextBoardList(board_no));
			
//			System.out.println(vo.getBoard_no());
			
			return "/board/read";
		}
		
		@RequestMapping(value = "/update" , method= RequestMethod.GET)
		public String BoardUpdateGET(
				/* @ModelAttribute("scri") SearchCriteria scri, */BoardVO vo, Model model) throws Exception
		{
			model.addAttribute("update", boardService.BoardRead(vo.getBoard_no()));
//			model.addAttribute("scri", scri);
//			List<Map<String, Object>> fileList = boardService.selectFileList(vo.getBoard_no());
//			model.addAttribute("file", fileList);
			
			
			return "/board/update";
		}
		
		//수정
		@RequestMapping(value = "/update", method= RequestMethod.POST)
		public String BoardUpdatePOST(/*@ModelAttribute("scri") SearchCriteria scri,*/BoardVO vo,Model model,RedirectAttributes rttr) throws Exception
		{
			try {
				boardService.BoardUpdate(vo);
				rttr.addFlashAttribute("msg", "글 수정을 완료하였습니다.");
			}catch (Exception e) {
				e.printStackTrace();
				logger.error("오류 : " + e);
			}
		
			rttr.addFlashAttribute("bno", vo.getBoard_no());
//			rttr.addFlashAttribute("page", scri.getPage());
//			rttr.addFlashAttribute("perPageNum", scri.getPerPageNum());
//			rttr.addFlashAttribute("searchType", scri.getSearchType());
//			rttr.addFlashAttribute("keyword", scri.getKeword());
			
			return "redirect:/board/list";
		}
		
		
		//삭제
		@RequestMapping(value = "/delete", method= {RequestMethod.GET,RequestMethod.POST})
		public String BoardDeletePOST(BoardVO vo, RedirectAttributes rttr) throws Exception
		{
			
			try {
			boardService.BoardDelete(vo.getBoard_no());
			rttr.addFlashAttribute("msg", "삭제를 성공하였습니다.");
			
			}catch(Exception e) {
			rttr.addFlashAttribute("msg", "오류가 발생하였습니다.");
			logger.error("오류 : " + e);
			}
			
			
			return "redirect:/board/list";
		}
}
