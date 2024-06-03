package com.with.community.dao;

import java.util.ArrayList;

import com.with.community.vo.MessageVO;

public interface MessageDAO {

	public ArrayList<MessageVO> selectMessageList(MessageVO vo) throws Exception;
	
	public ArrayList<MessageVO> selectRoomContentList(MessageVO vo) throws Exception;
	
	public int selectMessageSendInList(MessageVO vo) throws Exception;
}
