package com.with.community.vo;


import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MailVO {
	
	private int mail_num;
	private String mail_id;
	private String mail_email;
	private String mail_keep;
	private Timestamp meil_regdate;
	private String mail_title;
	private String mail_content;
	private String mail_file;
	private String mail_readCheck;
	private MultipartFile uploadFile;
}
