package com.with.community.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.community.vo.MessageVO;

@Repository
public class MsgDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<MessageVO> messageList(MessageVO vo) throws Exception {
		String nick = vo.getNick();
		
		ArrayList<MessageVO> list = (ArrayList) sqlSession.selectList("message_list",vo);
		
		for(MessageVO mvo : list) {
			mvo.setNick(nick);
			
			int unread = sqlSession.selectOne("count_unread",mvo);
			
			String profile = sqlSession.selectOne("get_other_profile",mvo);
			
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
	
	public ArrayList<MessageVO> roomContentList(MessageVO vo) throws Exception
	{
		System.out.println("room:" + vo.getMsg_room());
		System.out.println("recv_nick:" + vo.getRecv_nick());
		System.out.println("nick:" + vo.getNick());
		
		ArrayList<MessageVO> cList = (ArrayList) sqlSession.selectList("room_content_list",vo);
		
		sqlSession.update("message_read_chk",vo);
		
		return cList;
	}
	
	
	public int messageSendInlist(MessageVO vo) throws Exception
	{
		if(vo.getMsg_room() == 0) {
			int exist_chat = sqlSession.selectOne("exist_chat",vo);
			
			if(exist_chat ==0) {
				int max_room = sqlSession.selectOne("max_room",vo);
				vo.setMsg_room(max_room+1);
			}else {
				int room = Integer.parseInt(sqlSession.selectOne("select_room",vo));
				vo.setMsg_room(room);
			}
		}
		
		int flag = sqlSession.insert("messageSendInlist",vo);
		return flag;
	}
	
	
	
} 
