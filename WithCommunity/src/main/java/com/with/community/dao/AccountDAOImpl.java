package com.with.community.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.AccountVO;

public class AccountDAOImpl implements AccountDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.AccountDAO";

	@Override
	public AccountVO login(AccountVO vo) throws Exception {
		return sqlSession.selectOne("namespace.login", vo);
	}

}
