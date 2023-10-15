package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.InquiryDAO;
import com.with.community.vo.InquiryVO;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Inject
	private InquiryDAO inquiryDAO;

	@Override
	public List<InquiryVO> selectInquiryList() throws Exception {
		return inquiryDAO.selectInquiryList();
	}

	@Override
	public InquiryVO selectInquiryDetail(int inq_no) throws Exception {
		return inquiryDAO.selectInquiryDetail(inq_no);
	}

	// 글작성
	@Override
	public void insertInquiry(InquiryVO vo) throws Exception {
		inquiryDAO.insertInquiry(vo);
	}

	@Override
	public InquiryVO selectInqCnt(InquiryVO Ivo) throws Exception {
		return inquiryDAO.selectInqCnt(Ivo);
	}
}
