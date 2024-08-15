package com.with.community.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	@Override
	public int updateImg(AccountVO avo) throws Exception {
		accountDAO.updateImg(avo);
		
		return 1;
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
	public void profileUdt(AccountVO vo) throws Exception {
		 accountDAO.profileUdt(vo);
	}
	@Override
	public void updateImg(String me_id, String me_image) throws Exception {
		accountDAO.updateImg(me_id,me_image);
	}
	@Override
	public int memberPwdCheck(AccountVO aVO) throws Exception {
		return accountDAO.memberPwdCheck(aVO);
	}
	@Override
	public void passwordUpdate(AccountVO aVO) throws Exception {
		accountDAO.passwordUpdate(aVO);
	}
	@Override
	public AccountVO memberIdSearch(AccountVO aVO) throws Exception {
		return accountDAO.memberIdSearch(aVO);
	}
	@Override
	public AccountVO idChk(AccountVO aVO) throws Exception {
		return accountDAO.idChk(aVO);
	}


}
