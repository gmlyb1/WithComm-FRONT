package com.with.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/error/")
public class ErrorPageController {

	
	@RequestMapping(value = "/403error" , method=RequestMethod.GET)
	public void noAuthorityerror() {
		
	}


}
