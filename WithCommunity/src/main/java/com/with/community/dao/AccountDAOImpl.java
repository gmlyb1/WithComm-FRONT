package com.with.community.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.with.community.vo.AccountVO;

public class AccountDAOImpl implements AccountDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.AccountDAO";

	@Override
	public void register(AccountVO vo) throws Exception {
		
		String hashedPw = new BCryptPasswordEncoder().encode(vo.getMe_pwd());
		
		sqlSession.insert("namespace.register", vo);
	}

	@Override
	public AccountVO login(AccountVO vo) throws Exception {
		return sqlSession.selectOne("namespace.login", vo);
	}


	@Override
	public int updateImg(AccountVO avo) throws Exception {
		
		int result = sqlSession.update("namespace.profileUdt", avo);
		
		System.out.println(" 결과 : " + result);
		return result;
	}

	@Override
	public void keepLogin(Map<String, Object> map) throws Exception {
		
		
		
		sqlSession.update("namespace.keepLogin", map);
	}

	@Override
	public AccountVO checkUserWithSessionKey(String sessionId) throws Exception {
		return sqlSession.selectOne("namespace.checkUserWithSessionKey", sessionId);
	}

	@Override
	public List<AccountVO> selectHomeList(AccountVO vo) throws Exception {
		return sqlSession.selectList("namespace.selectHomeList",vo);
	}

	@Override
	public int deleteAccount(String me_id) throws Exception {
		return sqlSession.delete("namespace.deleteAccount",me_id);
	}

	@Override
	public void profileUdt(AccountVO vo) throws Exception {
		sqlSession.update("namespace.profileUdt",vo);
	}

	@Override
	public void updateImg(String me_id, String me_image) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("me_image", me_image);
		paramMap.put("me_id", me_id);
		
		sqlSession.update("namespace.updateImg",paramMap);
	}

	@Override
	public int memberPwdCheck(AccountVO aVO) throws Exception {
		return sqlSession.selectOne("namespace.memberPwdCheck", aVO);
	}

	@Override
	public void passwordUpdate(AccountVO aVO) throws Exception {
		sqlSession.update("namespace.passwordUpdate",aVO);
	}

	@Override
	public AccountVO memberIdSearch(AccountVO aVO) throws Exception {
		return sqlSession.selectOne("namespace.memberIdSearch",aVO);
	}

	@Override
	public AccountVO idChk(AccountVO aVO) throws Exception {
		return sqlSession.selectOne("namespace.idChk", aVO);
	}

	@Override
	public List<AccountVO> messageMemberList(AccountVO vo) throws Exception {
		return sqlSession.selectList("namespace.messageMemberList",vo);
	}





}
