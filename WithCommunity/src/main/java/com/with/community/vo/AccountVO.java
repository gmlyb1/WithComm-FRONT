package com.with.community.vo;


import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class AccountVO {
	
	private Integer me_id;
	private String me_email;
	private String me_pwd;
	private String me_name;
	private String me_real_name;
	private String me_phone;
	private Date me_regDate;
	private String me_image;
	private int adminCk;
	private String state;
	private boolean useCookie;
	private boolean locked;
	
	
	private String sessionId;
	private Date sessionLimit;
	
	
	
}
