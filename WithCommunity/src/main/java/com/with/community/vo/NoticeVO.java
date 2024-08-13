package com.with.community.vo;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	
	private int rowNo;
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private int notice_count;
	private Timestamp notice_regdate;
	private Timestamp notice_updateDate;
	private Boolean isFixed;
	private Boolean useYn;
	
	private Boolean isNew; 
	
	
	
	
	
	
	
	
}
