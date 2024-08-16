package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.InquiryDAO;
import com.with.community.vo.Criteria;
import com.with.community.vo.InquiryVO;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Inject
	private InquiryDAO inquiryDAO;

	@Override
	public List<InquiryVO> selectInquiryList(Criteria cri) throws Exception {
		return inquiryDAO.selectInquiryList(cri);
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
	public int selectInqCnt(Criteria cri) throws Exception {
		return inquiryDAO.selectInqCnt(cri);
	}

	@Override
	public List<InquiryVO> HomeInquiryList(InquiryVO ivo) throws Exception {
		return inquiryDAO.HomeInquiryList(ivo);
	}
}
