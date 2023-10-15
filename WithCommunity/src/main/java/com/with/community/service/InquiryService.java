package com.with.community.service;

import java.util.List;

import com.with.community.vo.InquiryVO;

public interface InquiryService {

	// 1:1문의
	public List<InquiryVO> selectInquiryList() throws Exception;
	
	public InquiryVO selectInquiryDetail(int inq_no) throws Exception;
	
	// 글 작성
	public void insertInquiry(InquiryVO vo) throws Exception;
	
	//나의 문의 개수
	public InquiryVO selectInqCnt(InquiryVO Ivo) throws Exception;
}
