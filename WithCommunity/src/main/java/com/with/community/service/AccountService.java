package com.with.community.service;

import com.with.community.vo.AccountVO;

public interface AccountService {

	//ȸ������
	public void register(AccountVO vo) throws Exception;
	
	//�α���
	public AccountVO login(AccountVO vo) throws Exception;
}
