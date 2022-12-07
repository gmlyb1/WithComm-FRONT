package com.with.community.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class AccountVO {
	
	private int me_id;
	private String me_email;
	private String me_pwd;
	private String me_name;
	private String me_grade;
	private Date me_regDate;
	private String me_image;
	private String me_addr1;
	private String me_addr2;
	private String me_addr3;
	private int verify;
	private int adminCk;
	public int getMe_id() {
		return me_id;
	}
	public void setMe_id(int me_id) {
		this.me_id = me_id;
	}
	public String getMe_email() {
		return me_email;
	}
	public void setMe_email(String me_email) {
		this.me_email = me_email;
	}
	public String getMe_pwd() {
		return me_pwd;
	}
	public void setMe_pwd(String me_pwd) {
		this.me_pwd = me_pwd;
	}
	public String getMe_name() {
		return me_name;
	}
	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}
	public String getMe_grade() {
		return me_grade;
	}
	public void setMe_grade(String me_grade) {
		this.me_grade = me_grade;
	}
	public Date getMe_regDate() {
		return me_regDate;
	}
	public void setMe_regDate(Date me_regDate) {
		this.me_regDate = me_regDate;
	}
	public String getMe_image() {
		return me_image;
	}
	public void setMe_image(String me_image) {
		this.me_image = me_image;
	}
	public String getMe_addr1() {
		return me_addr1;
	}
	public void setMe_addr1(String me_addr1) {
		this.me_addr1 = me_addr1;
	}
	public String getMe_addr2() {
		return me_addr2;
	}
	public void setMe_addr2(String me_addr2) {
		this.me_addr2 = me_addr2;
	}
	public String getMe_addr3() {
		return me_addr3;
	}
	public void setMe_addr3(String me_addr3) {
		this.me_addr3 = me_addr3;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	public int getAdminCk() {
		return adminCk;
	}
	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}
	
	@Override
	public String toString() {
		return "AccountVo [me_id=" + me_id + ", me_email=" + me_email + ", me_pwd=" + me_pwd + ", me_name=" + me_name
				+ ", me_grade=" + me_grade + ", me_image=" + me_image + ", me_addr1=" + me_addr1 + ", me_addr2="
				+ me_addr2 + ", me_addr3=" + me_addr3 + ", verify=" + verify + ", adminCk=" + adminCk + "]";
	}
	
	
}
