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
}
