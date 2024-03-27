package com.with.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.community.controller.EmailController;
import com.with.community.vo.MailVO;

@Repository
public class MailDAOImpl implements MailDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	private static final String namespace = "com.with.community.dao.MailDAO";
	@Override
	public List<MailVO> mailList(String mail_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("namespace.mailList", mail_id);
	}
	@Override
	public MailVO recevRead(int mail_num) throws Exception {
		
		MailVO mVO = sqlSession.selectOne("namespace.recevRead", mail_num);
		
		if(mVO.getMail_readCheck().equals("0")) {
		   mVO.setMail_readCheck("1");
		   sqlSession.update("namespace.recevReadChk", mail_num);
		}
		
		
		return mVO;
	}
	@Override
	public String mailName(String mailName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("namespace.recevAndSend", mailName);
	}
	
	
	
}
