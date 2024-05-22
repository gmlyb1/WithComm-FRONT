package com.with.community.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.with.community.service.KnowService;
import com.with.community.service.ReplyService;
import com.with.community.vo.Criteria;
import com.with.community.vo.KnowVO;
import com.with.community.vo.PageMaker;

@Controller
@RequestMapping("/know/*")
public class KnowController {
	
	@Autowired
	@Inject
	private KnowService knowService;
	
	@Inject
	private ReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(KnowController.class);
	
	@RequestMapping(value = "/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String knowList(@ModelAttribute("vo") KnowVO vo, HttpServletRequest request, Model model, Criteria cri) throws Exception{
		
		List<KnowVO> knowList = knowService.KnowList(cri);
		int totCnt = knowService.getListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(knowService.getListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("knowList", knowList);
		
		
		return "/know/list";
	}
	
	@RequestMapping(value = "/read", method=RequestMethod.GET)
	public String KnowRead(@RequestParam("know_no") int know_no, KnowVO vo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		model.addAttribute("read", knowService.KnowRead(know_no));
		
		
		return "/know/read";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void insertKnowGET() {
		
	}
	
	@RequestMapping(value = "/create" , method = RequestMethod.POST)
	public String insertKnowPOST(@ModelAttribute("vo") KnowVO vo, HttpServletRequest request) throws Exception
	{
		knowService.insertKnow(vo);
		
		return "redirect:/know/list";
	}

	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public String updateKnowGET(KnowVO vo, Model model) throws Exception
	{
		model.addAttribute("update", knowService.KnowRead(vo.getKnow_no()));
		
		return "/know/update";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateKnowPOST(KnowVO vo, Model model ) throws Exception
	{
		
		knowService.updateKnow(vo);
		
		return "redirect:/know/list";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteKnowPOST(KnowVO vo) throws Exception
	{
		knowService.deleteKnow(vo.getKnow_no());
		
		return "redirect:/know/list";
	}
}
