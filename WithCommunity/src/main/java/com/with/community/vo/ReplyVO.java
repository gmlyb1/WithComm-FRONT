package com.with.community.vo;

import java.sql.Date;

public class ReplyVO {
	
	private int board_no;
	private int reply_no;
	private String reply_content;
	private String reply_writer;
	private Date reply_regdate;

	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public Date getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	
	@Override
	public String toString() {
		return "replyVO [board_no=" + board_no + ", reply_no=" + reply_no + ", reply_content=" + reply_content
				+ ", reply_writer=" + reply_writer + ", reply_regdate=" + reply_regdate + "]";
	}
}
