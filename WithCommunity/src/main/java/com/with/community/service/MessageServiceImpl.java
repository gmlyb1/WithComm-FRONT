package com.with.community.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.MessageDAO;
import com.with.community.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;

	@Override
	public ArrayList<MessageVO> selectMessageList(MessageVO vo) throws Exception {
		return messageDAO.selectMessageList(vo);
	}

	@Override
	public ArrayList<MessageVO> selectRoomContentList(MessageVO vo) throws Exception {
		return messageDAO.selectRoomContentList(vo);
	}

	@Override
	public int selectMessageSendInList(MessageVO vo) throws Exception {
		
		return messageDAO.selectMessageSendInList(vo);
	}
}
