package com.with.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.with.community.service.InquiryService;
import com.with.community.vo.InquiryVO;

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
		
		return "/inquiry/list";
	}
	
	
}
