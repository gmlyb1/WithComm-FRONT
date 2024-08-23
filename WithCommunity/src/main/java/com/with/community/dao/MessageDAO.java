package com.with.community.dao;

import java.util.List;

import com.with.community.vo.Criteria;
import com.with.community.vo.MessageVO;

public interface MessageDAO {

	public String countMessageView(String me_email) throws Exception;

//	public List<MessageVO> selectMessageList(String recev_name) throws Exception;
	
	public List<MessageVO> selectMessageList(MessageVO messageVO) throws Exception;

	public void sendMessage(MessageVO messageVO) throws Exception;

}
