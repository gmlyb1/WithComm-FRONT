package com.with.community.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.with.community.vo.AccountVO;

public interface AccountDAO {

	// 회원가입
	public void register(AccountVO vo) throws Exception;
	
	//로그인
	public AccountVO login(AccountVO vo) throws Exception;
	
	//아이디 중복체크
	public AccountVO idChk(AccountVO aVO)throws Exception;
	
	// 프로필 사진 변경
	public int updateImg(AccountVO avo)throws Exception;
	
	// 로그인 유지 처리
	public void keepLogin(Map<String, Object> map) throws Exception;
	
	//비밀번호 변경
	public void profileUdt(AccountVO vo) throws Exception;
	
	// 세션 키 검증
	public AccountVO checkUserWithSessionKey(String sessionId) throws Exception;
	
	public List<AccountVO> selectHomeList(AccountVO vo) throws Exception;
	
	public int deleteAccount(String me_id) throws Exception;
	
	public AccountVO memberIdSearch(AccountVO aVO)throws Exception;
	
	public void updateImg(String me_id, String me_image) throws Exception;
	
	public int memberPwdCheck(AccountVO aVO)throws Exception;
	
	public void passwordUpdate(AccountVO aVO)throws Exception;



	
}
