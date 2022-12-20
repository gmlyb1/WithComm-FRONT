package com.with.community.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.with.community.service.NoticeService;
import com.with.community.vo.NoticeVO;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String NoticeList(@ModelAttribute("vo")NoticeVO vo,HttpServletRequest request,Model model) throws Exception {
		
		List<NoticeVO> NoticeList = noticeService.NoticeList();
		model.addAttribute("NoticeList", NoticeList);
		
		return "/notice/list";
	}
}
