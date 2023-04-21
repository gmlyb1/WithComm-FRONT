package com.with.community.dao;

import java.util.Date;
import java.util.List;

import com.with.community.vo.AccountVO;

public interface AccountDAO {

	// 회원가입
	public void register(AccountVO vo) throws Exception;
	
	//로그인
	public AccountVO login(AccountVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(AccountVO vo) throws Exception;
	
	// 프로필 사진 변경
	public void updateImg(String me_image, String me_id)throws Exception;
	
	// 로그인 유지 처리
	public void keepLogin(String me_id, String sessionId, Date sessionLimit) throws Exception;
	
	// 세션 키 검증
	public AccountVO checkUserWithSessionKey(String value) throws Exception;
	
	public List<AccountVO> selectHomeList(AccountVO vo) throws Exception;
	
	public int deleteAccount(String me_id) throws Exception;
}
