package com.with.community.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class BoardVO extends PageVO{

	private int board_no;
	private int board_bgno;
	private String board_title;
	private String board_content;
	private String board_writer;
	private int board_count;
	private Timestamp board_regdate;
	private int board_hit;
	private int board_reply_hit;
	private int reply_cnt;
	
	private int bgnoinsert;

	//이전 , 다음글
	private int next;
	private int last;
	private String nexttitle;
	private String lasttitle;

	
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getBoard_bgno() {
		return board_bgno;
	}
	public void setBoard_bgno(int board_bgno) {
		this.board_bgno = board_bgno;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public Timestamp getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Timestamp board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public int getBoard_reply_hit() {
		return board_reply_hit;
	}
	public void setBoard_reply_hit(int board_reply_hit) {
		this.board_reply_hit = board_reply_hit;
	}
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public int getBgnoinsert() {
		return bgnoinsert;
	}
	public void setBgnoinsert(int bgnoinsert) {
		this.bgnoinsert = bgnoinsert;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getNexttitle() {
		return nexttitle;
	}
	public void setNexttitle(String nexttitle) {
		this.nexttitle = nexttitle;
	}
	public String getLasttitle() {
		return lasttitle;
	}
	public void setLasttitle(String lasttitle) {
		this.lasttitle = lasttitle;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", board_bgno=" + board_bgno + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_writer=" + board_writer + ", board_count=" + board_count
				+ ", board_regdate=" + board_regdate + ", board_hit=" + board_hit + ", board_reply_hit="
				+ board_reply_hit + ", reply_cnt=" + reply_cnt + ", bgnoinsert=" + bgnoinsert + ", next=" + next
				+ ", last=" + last + ", nexttitle=" + nexttitle + ", lasttitle=" + lasttitle + "]";
	}
	public void setPrev(Boolean xprev) {
		// TODO Auto-generated method stub
		
	}
	public void setNext(Boolean xnext) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	
}
