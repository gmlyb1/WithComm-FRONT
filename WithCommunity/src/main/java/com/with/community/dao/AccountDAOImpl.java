package com.with.community.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

	@Override
	public void updateImg(String me_image, String me_id) throws Exception {
		sqlSession.update("namespace.updateImg", me_id);
	}

	@Override
	public void keepLogin(String me_id, String sessionId, Date sessionLimit) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("me_id", me_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		
		
		sqlSession.update("namespace.keepLogin", paramMap);
	}

	@Override
	public AccountVO checkUserWithSessionKey(String value) throws Exception {
		return sqlSession.selectOne("namespace.checkUserWithSessionKey", value);
	}


}
