package com.with.community.service;

import java.util.List;

import com.with.community.vo.InquiryVO;

public interface InquiryService {

	// 1:1문의
	public List<InquiryVO> selectInquiryList() throws Exception;
	
	public InquiryVO selectInquiryDetail(int inq_no) throws Exception;
}
