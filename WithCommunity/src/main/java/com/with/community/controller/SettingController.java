package com.with.community.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.with.community.service.SettingService;


@Controller
@RequestMapping("/setting")
public class SettingController {

//	@Autowired
//	@Inject
//	private SettingService settingService;
	
	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);
	
	@RequestMapping(value="/control", method=RequestMethod.GET)
	public String SettingControlPage() throws Exception {
		return "/setting/control";
	}
}
