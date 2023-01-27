package com.with.community.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.AccountVO;

public class AccountDAOImpl implements AccountDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.AccountDAO";

	@Override
	public void register(AccountVO vo) throws Exception {
		sqlSession.insert("namespace.register", vo);
	}

	@Override
	public AccountVO login(AccountVO vo) throws Exception {
		return sqlSession.selectOne("namespace.login", vo);
	}

//	@Override
	public int idChk(AccountVO vo) throws Exception {
		int result = sqlSession.selectOne("namespace.idChk", vo);
		return result;
	}


}
