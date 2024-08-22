package com.with.community.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.MessageDAO";

	@Override
	public String countMessageView(String me_email) throws Exception {
		return sqlSession.selectOne("namespace.countMessageView", me_email);
	}
}
