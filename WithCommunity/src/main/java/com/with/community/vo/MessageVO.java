package com.with.community.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageVO {
	
	private int rowNo;
	private int msg_id;
	private String msg_title;
	private String msg_content;
	private String recev_name;
	private int gubun;
	private Date create_dt;
	private String sender_name;
	private String me_email;
	private int read_yn;
	
}
