package com.with.community.dao;

import java.util.List;

import com.with.community.vo.InquiryVO;

public interface InquiryDAO {

	
	//1:1문의 리스트
	public List<InquiryVO> selectInquiryList() throws Exception;
	
	public InquiryVO selectInquiryDetail(int inq_no) throws Exception;
}
