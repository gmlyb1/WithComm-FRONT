package com.with.community.dao;

import java.util.List;

import com.with.community.vo.BoardVO;
import com.with.community.vo.ReplyVO;

public interface ReplyDAO {

		public List<ReplyVO> replyList(int board_no) throws Exception;
		
		public void replyWrite(ReplyVO vo) throws Exception;
		
		public void replyModify(ReplyVO vo) throws Exception;
		
		public void replyDelete(int reply_no)throws Exception;
		
		public void replyUpdate(BoardVO bvo) throws Exception;
		
		public void modifyReply(int reply_no,int board_no, String reply_content) throws Exception;
}
