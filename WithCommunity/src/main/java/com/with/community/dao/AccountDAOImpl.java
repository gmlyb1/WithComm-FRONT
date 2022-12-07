package com.with.community.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class AccountDAOImpl implements AccountDAO{

	@Inject
	private SqlSession sqlSession;
}
