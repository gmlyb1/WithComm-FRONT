package com.with.community.dao;

import com.with.community.vo.AccountVO;

public interface AccountDAO {

	// 회원가입
	public void register(AccountVO vo) throws Exception;
	
	//로그인
	public AccountVO login(AccountVO vo) throws Exception;
}
