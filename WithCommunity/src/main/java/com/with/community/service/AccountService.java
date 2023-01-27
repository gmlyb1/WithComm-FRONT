package com.with.community.service;

import com.with.community.vo.AccountVO;

public interface AccountService {

	//회원가입
	public void register(AccountVO vo) throws Exception;
	
	//로그인
	public AccountVO login(AccountVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(AccountVO vo) throws Exception;
}
