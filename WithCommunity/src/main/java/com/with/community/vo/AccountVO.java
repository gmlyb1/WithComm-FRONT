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
	private Date me_regDate;
	private String me_image;
	private int adminCk;
	private String state;
	private String aprvStts;
	

	
	
	
}
