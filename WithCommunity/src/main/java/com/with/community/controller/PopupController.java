package com.with.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/popup")
public class PopupController {


	@RequestMapping(value="/popup", method=RequestMethod.GET)
	public String popupGET() {
		
		return "/popup/popup";
	}
}
