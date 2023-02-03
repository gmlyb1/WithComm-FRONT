package com.with.community.vo;

import java.sql.Timestamp;

public class InquiryVO {

	private int inq_no;
	private String inq_title;
	private String inq_content;
	private String inq_name;
	private Timestamp inq_regdate;
	public int getInq_no() {
		return inq_no;
	}
	public void setInq_no(int inq_no) {
		this.inq_no = inq_no;
	}
	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public String getInq_content() {
		return inq_content;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}
	public String getInq_name() {
		return inq_name;
	}
	public void setInq_name(String inq_name) {
		this.inq_name = inq_name;
	}
	public Timestamp getInq_regdate() {
		return inq_regdate;
	}
	public void setInq_regdate(Timestamp inq_regdate) {
		this.inq_regdate = inq_regdate;
	}
	@Override
	public String toString() {
		return "InquiryVO [inq_no=" + inq_no + ", inq_title=" + inq_title + ", inq_content=" + inq_content
				+ ", inq_name=" + inq_name + ", inq_regdate=" + inq_regdate + "]";
	}
	
	
	
	
}
