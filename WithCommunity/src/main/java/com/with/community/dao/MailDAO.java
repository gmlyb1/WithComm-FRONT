package com.with.community.dao;

import java.util.List;

import com.with.community.vo.MailVO;

public interface MailDAO {

	// 메일 목록 조회
	public List<MailVO> mailList(String mail_id) throws Exception;
	
	// 수신 메일 읽기
	public MailVO recevRead(int mail_num) throws Exception;
	
	// 수신자/발신자 이름
	public String mailName(String mailName) throws Exception;
}
