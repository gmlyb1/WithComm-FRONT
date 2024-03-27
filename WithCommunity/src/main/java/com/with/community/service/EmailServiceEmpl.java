package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.MailDAO;
import com.with.community.vo.MailVO;

@Service
public class EmailServiceEmpl implements EmailService {

	@Inject
	private MailDAO mailDAO;
	
	@Override
	public List<MailVO> mailList(String mail_id) throws Exception {
		// TODO Auto-generated method stub
		return mailDAO.mailList(mail_id);
	}

	@Override
	public MailVO recevRead(int mail_num) throws Exception {
		// TODO Auto-generated method stub
		return mailDAO.recevRead(mail_num);
	}

	@Override
	public String mailName(String mailName) throws Exception {
		// TODO Auto-generated method stub
		return mailDAO.mailName(mailName);
	}

	
	


}
