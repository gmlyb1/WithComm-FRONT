package com.with.community.service;

import java.util.Date;
import java.util.List;

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
	@Override
	public void updateImg(String me_image, String me_id) throws Exception {
		accountDAO.updateImg(me_image, me_id);
	}
	@Override
	public void keepLogin(String me_id, String sessionId, Date sessionLimit) throws Exception {
		accountDAO.keepLogin(me_id, sessionId, sessionLimit);
	}
	@Override
	public AccountVO checkUserWithSessionKey(String value) throws Exception {
		return accountDAO.checkUserWithSessionKey(value);
	}
	@Override
	public List<AccountVO> selectHomeList(AccountVO vo) throws Exception {
		return accountDAO.selectHomeList(vo);
	}
	@Override
	public int deleteAccount(String me_id) throws Exception {
		return accountDAO.deleteAccount(me_id);
	}
	
	// 비밀번호 변경
	@Override
	public void pwdUdt(AccountVO vo) throws Exception {
		 accountDAO.pwdUdt(vo);
	}


}
