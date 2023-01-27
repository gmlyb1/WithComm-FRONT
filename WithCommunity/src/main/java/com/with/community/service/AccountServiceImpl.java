package com.with.community.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.AccountDAO;
import com.with.community.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Inject
	private AccountDAO accountDAO;
	
	@Override
	public void register(AccountVO vo) throws Exception {
		accountDAO.register(vo);
	}
	@Override
	public AccountVO login(AccountVO vo) throws Exception {
		return accountDAO.login(vo);
	}
//	@Override
	public int idChk(AccountVO vo) throws Exception {
		int result = accountDAO.idChk(vo);
		return result;
	}


}
