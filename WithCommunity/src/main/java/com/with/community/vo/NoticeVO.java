package com.with.community.vo;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeVO {

	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private int notice_count;
	private Timestamp notice_regdate;
	private Timestamp notice_updateDate;
	private Boolean isFixed;
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public Timestamp getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Timestamp notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public Timestamp getNotice_updateDate() {
		return notice_updateDate;
	}
	public void setNotice_updateDate(Timestamp notice_updateDate) {
		this.notice_updateDate = notice_updateDate;
	}
	public Boolean getIsFixed() {
		return isFixed;
	}
	public void setIsFixed(Boolean isFixed) {
		this.isFixed = isFixed;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_writer=" + notice_writer + ", notice_count=" + notice_count
				+ ", notice_regdate=" + notice_regdate + ", notice_updateDate=" + notice_updateDate + ", isFixed="
				+ isFixed + "]";
	}
	
	
	
	
	
	
	
}
