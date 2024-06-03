package com.with.community.vo;

import java.sql.Timestamp;

import lombok.ToString;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
@ToString
public class InquiryVO {

	private int inq_no;
	private String inq_title;
	private String inq_content;
	private String inq_name;
	private Timestamp inq_regdate;
	
	private String me_name;
	private int inqCount;
	private String answerYn;
	
	
	
	
}
