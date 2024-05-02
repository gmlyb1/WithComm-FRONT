package com.with.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.Criteria;
import com.with.community.vo.InquiryVO;

public class InquiryDAOImpl implements InquiryDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.InquiryDAO";

	@Override
	public List<InquiryVO> selectInquiryList(Criteria cri) throws Exception {
		return sqlSession.selectList("namespace.selectInquiryList",cri);
	}

	@Override
	public InquiryVO selectInquiryDetail(int inq_no) throws Exception {
		return sqlSession.selectOne("namespace.selectInquiryDetail", inq_no);
	}

	@Override
	public void insertInquiry(InquiryVO vo) throws Exception {
		sqlSession.insert("namespace.insertInquiry",vo);
	}

	@Override
	public int selectInqCnt(Criteria cri) throws Exception {
		return sqlSession.selectOne("namespace.selectInqCnt",cri);
	}
}
