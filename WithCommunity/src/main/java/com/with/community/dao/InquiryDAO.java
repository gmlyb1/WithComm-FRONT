package com.with.community.dao;

import java.util.List;

import com.with.community.vo.InquiryVO;

public interface InquiryDAO {

	
	//1:1문의 리스트
	public List<InquiryVO> selectInquiryList() throws Exception;
	
	public InquiryVO selectInquiryDetail(int inq_no) throws Exception;
	
	//글쓰기
	public void insertInquiry(InquiryVO vo) throws Exception;
	
	//나의 문의 개수
	public InquiryVO selectInqCnt(InquiryVO Ivo) throws Exception;
}
