package com.with.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.Criteria;
import com.with.community.vo.KnowVO;

public class KnowDAOImpl implements KnowDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.KnowDAO";

	@Override
	public List<KnowVO> KnowList(Criteria cri) throws Exception {
		return sqlSession.selectList("namespace.KnowList", cri);
	}
	
	@Override
	public KnowVO KnowRead(int know_no) throws Exception {
		return sqlSession.selectOne("namespace.KnowRead", know_no);
	}

	@Override
	public int getListCount(Criteria cri) throws Exception {
		return sqlSession.selectOne("namespace.getListCount", cri);
	}

	@Override
	public void insertKnow(KnowVO vo) throws Exception {
		sqlSession.insert("namespace.insertKnow",vo);
	}

	@Override
	public void updateKnow(KnowVO vo) throws Exception {
		sqlSession.update("namespace.updateKnow",vo);
	}

	@Override
	public void deleteKnow(int know_no) throws Exception {
		sqlSession.delete("namespace.deleteKnow",know_no);
	}


}
