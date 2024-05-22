package com.with.community.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO{
	
	private int rowNo;
	private int board_no;
	private int board_bgno;
	private String board_title;
	private String board_content;
	private String board_writer;
	private int board_count;
	private Timestamp board_regdate;
	private Timestamp board_updateDate;
	private int board_hit;
	private int board_reply_hit;
	private int reply_cnt;
	
	private int bgnoinsert;
	
	private int reply_no;
	private String reply_content;

	

	
	
	
	
	
}
