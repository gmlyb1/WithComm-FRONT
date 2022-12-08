package com.with.community.service;

import java.util.List;

import com.with.community.vo.ReplyVO;

public interface ReplyService {

	// ´ñ±Û ¸ñ·Ï
			public List<ReplyVO> replyList(int board_no) throws Exception;
			
			// ´ñ±Û ÀÛ¼º
			public void replyWrite(ReplyVO vo) throws Exception;
			
			// ´ñ±Û ¼öÁ¤
			public void replyModify(ReplyVO vo) throws Exception;
			
			// ´ñ±Û »èÁ¦
			public void replyDelete(int reply_no)throws Exception;
}
