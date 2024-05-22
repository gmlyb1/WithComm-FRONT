package com.with.community.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KnowVO {
	
	private int know_no;
	private String know_title;
	private String know_content;
	private String know_writer;
	private int know_count;
	private Timestamp know_regdate;
	private Timestamp know_updateDate;
	private int reply_no;
}
