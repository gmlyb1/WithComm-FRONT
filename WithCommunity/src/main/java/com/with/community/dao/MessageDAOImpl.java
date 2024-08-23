package com.with.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.Criteria;
import com.with.community.vo.MessageVO;

public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.MessageDAO";

	@Override
	public String countMessageView(String me_email) throws Exception {
		return sqlSession.selectOne("namespace.countMessageView", me_email);
	}

//	@Override
//	public List<MessageVO> selectMessageList(String recev_name) throws Exception {
//		
//		return sqlSession.selectList("namespace.selectMessageList",recev_name);
//	}
	
	@Override
	public List<MessageVO> selectMessageList(MessageVO messageVO) throws Exception {
		
		return sqlSession.selectList("namespace.selectMessageList",messageVO);
	}

	@Override
	public void sendMessage(MessageVO messageVO) throws Exception {
		sqlSession.insert("namespace.sendMessage", messageVO);
	}

	@Override
	public MessageVO sendMsgDetail(MessageVO messageVO) throws Exception {
		return sqlSession.selectOne("namespace.sendMsgDetail",messageVO);
	}


}
