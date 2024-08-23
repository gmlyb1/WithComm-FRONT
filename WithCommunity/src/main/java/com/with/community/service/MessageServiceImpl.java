package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.MessageDAO;
import com.with.community.vo.Criteria;
import com.with.community.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;

	@Override
	public String countMessageView(String me_email) throws Exception{
		return messageDAO.countMessageView(me_email);
	}
	
	@Override
	public List<MessageVO> selectMessageList(MessageVO messageVO) throws Exception {
		return messageDAO.selectMessageList(messageVO);
	}

//	@Override
//	public List<MessageVO> selectMessageList(String recev_name) throws Exception {
//		return messageDAO.selectMessageList(recev_name);
//	}

	@Override
	public void sendMessage(MessageVO messageVO) throws Exception {
		messageDAO.sendMessage(messageVO);
	}

	
}
