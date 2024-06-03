package com.with.community.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.MessageVO;

public class MessageDAOImpl implements MessageDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.MessageDAO";

	@Override
	public ArrayList<MessageVO> selectMessageList(MessageVO vo) throws Exception {
		String nick = vo.getNick();
		
		ArrayList<MessageVO> list = (ArrayList) sqlSession.selectList("namespace.message_list", vo);
		
		for(MessageVO mvo: list) {
			mvo.setNick(nick);
			
			int unread = sqlSession.selectOne("namespace.count_unread", mvo);
			
			String profile = sqlSession.selectOne("namespace.get_other_profile", mvo);
			
			mvo.setUnread(unread);
			mvo.setProfile(profile);
			
			if(nick.equals(mvo.getSend_nick())) {
				mvo.setOther_nick(mvo.getRecv_nick());
			}else {
				mvo.setOther_nick(mvo.getSend_nick());
			}
		}
		
		
		return list;
	}

	@Override
	public ArrayList<MessageVO> selectRoomContentList(MessageVO vo) throws Exception {

		System.out.println("room: " + vo.getMsg_room());
		System.out.println("recv_nick:" + vo.getRecv_nick());
		System.out.println("nick: " + vo.getNick());
		
		ArrayList<MessageVO> cList = (ArrayList) sqlSession.selectList("namespace.room_content_list", vo);
		
		sqlSession.update("namespace.message_read_chk", vo);
		
		return cList;
	}

	@Override
	public int selectMessageSendInList(MessageVO vo) throws Exception {
		if(vo.getMsg_room() == 0) {
			int exist_chat = sqlSession.selectOne("namespace.exist_chat", vo);
				
			if(exist_chat ==0) {
				int max_room = sqlSession.selectOne("namespace.select_room", vo);
				vo.setMsg_room(max_room+1);
			}else {
				int room = Integer.parseInt(sqlSession.selectOne("namespace.select_room",vo));
				vo.setMsg_room(room);
			}
		}
		
		int flag = sqlSession.insert("namespace.selectMessageSendInList", vo);
		
		return flag;
	}
	
}
