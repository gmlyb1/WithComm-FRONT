package com.with.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.InquiryVO;

public class InquiryDAOImpl implements InquiryDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.InquiryDAO";

	@Override
	public List<InquiryVO> selectInquiryList() throws Exception {
		return sqlSession.selectList("namespace.selectInquiryList");
	}

	@Override
	public InquiryVO selectInquiryDetail(int inq_no) throws Exception {
		return sqlSession.selectOne("namespace.selectInquiryDetail", inq_no);
	}
}
