package com.with.community.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;

	@Override
	public String countMessageView(String me_email) throws Exception{
		return messageDAO.countMessageView(me_email);
	}
}
