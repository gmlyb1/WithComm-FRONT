package com.with.community.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	
	//게시판 목록
		@RequestMapping(value = "/list", method=RequestMethod.GET)
		public String BoardList(@ModelAttribute("vo") BoardVO vo,HttpServletRequest request,Model model) throws Exception 
		{
			Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
			
			if(null != inputFlashMap) {
				model.addAttribute("msg", (String)inputFlashMap.get("msg"));
			}
			//게시물 목록
			List<BoardVO> boardList = boardService.BoardList();
			model.addAttribute("boardList", boardList);
			
			return "/board/list";
		}
		
		// 게시글 등록 (GET)
		@RequestMapping(value = "/create", method= RequestMethod.GET)
		public void insertBoardGET() {
		}
		
		// 게시글 등록 (POST)
		@RequestMapping(value= "/create" , method = RequestMethod.POST)
		public String insertBoardPOST(@ModelAttribute("vo") BoardVO vo,HttpServletRequest request ,RedirectAttributes redirect) throws Exception 
		{
			
		try {
			SimpleDateFormat format1= new SimpleDateFormat("yyyy-MM-dd");
			
			Date time = new Date();
			
			String time1 = format1.format(time);
			vo.setBoard_regdate(time1);
			
			boardService.insertBoard(vo);
			
			redirect.addFlashAttribute("redirect", vo.getBoard_no());
			redirect.addFlashAttribute("msg", "등록이 완료되었습니다.");
			
		} catch (Exception e) {
				redirect.addFlashAttribute("msg", "오류가 발생되었습니다");
		}
			
			return "redirect:/board/list";
	}
		
		@RequestMapping(value = "/read", method=RequestMethod.GET)
		public String BoardRead(@RequestParam("board_no") int board_no,BoardVO vo, Model model) throws Exception {
			
			
			model.addAttribute("read", boardService.BoardRead(vo.getBoard_no()));
			
			
			List<ReplyVO> replyList = replyService.replyList(vo.getBoard_no());
			model.addAttribute("replyList", replyList);
			// 이전글 다음글
//			model.addAttribute("move", boardService.movePage(vo.getBoard_no()));
			
//			System.out.println(vo.getBoard_no());
			
			return "/board/read";
		}
		
		@RequestMapping(value = "/update" , method= RequestMethod.GET)
		public String BoardUpdateGET(BoardVO vo, Model model) throws Exception
		{
			model.addAttribute("update", boardService.BoardRead(vo.getBoard_no()));
//			List<Map<String, Object>> fileList = boardService.selectFileList(vo.getBoard_no());
//			model.addAttribute("file", fileList);
			
			
			return "/board/update";
		}
		
		//게시글 수정
		@RequestMapping(value = "/update", method= RequestMethod.POST)
		public String BoardUpdatePOST(BoardVO vo,Model model,RedirectAttributes rttr) throws Exception
		{
			try {
				boardService.BoardUpdate(vo);
				rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
			}catch (Exception e) {
				rttr.addFlashAttribute("msg", "오류가 발생되었습니다.");
			}
			
			return "redirect:/board/list";
		}
		
		
		//게시글 삭제
		@RequestMapping(value = "/delete", method=RequestMethod.POST)
		public String BoardDeletePOST(BoardVO vo, RedirectAttributes rttr) throws Exception
		{
			
			try {
			boardService.BoardDelete(vo.getBoard_no());
			rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
			
			}catch(Exception e) {
			rttr.addFlashAttribute("msg", "오류가 발생되었습니다.");
			}
			
			
			return "redirect:/board/list";
		}
}
