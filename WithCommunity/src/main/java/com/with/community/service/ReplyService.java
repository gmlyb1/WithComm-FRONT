package com.with.community.service;

import java.util.List;

import com.with.community.vo.BoardVO;
import com.with.community.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyList(int board_no) throws Exception;
	
	public void replyWrite(ReplyVO vo) throws Exception;
	
	public void replyDelete(int reply_no)throws Exception;

	public void replyUpdate(BoardVO bvo) throws Exception;
	
	// 버튼 댓글 수정
	public void modifyReply(int reply_no,String edited_content) throws Exception;
}
