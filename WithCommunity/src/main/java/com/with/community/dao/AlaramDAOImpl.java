package com.with.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.AlaramVO;

public class AlaramDAOImpl implements AlaramDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.AlaramDAO";


	@Override
	public List<AlaramVO> selectAlarm(String hsid) {
		return sqlSession.selectList("namespace.selectAlarm", hsid);
	}
}
