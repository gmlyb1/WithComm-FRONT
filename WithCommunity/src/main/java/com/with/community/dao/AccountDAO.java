package com.with.community.dao;

import com.with.community.vo.AccountVO;

public interface AccountDAO {

	// ȸ������
	public void register(AccountVO vo) throws Exception;
	
	//�α���
	public AccountVO login(AccountVO vo) throws Exception;
}
