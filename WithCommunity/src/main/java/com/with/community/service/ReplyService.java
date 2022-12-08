package com.with.community.service;

import java.util.List;

import com.with.community.vo.ReplyVO;

public interface ReplyService {

	// ��� ���
			public List<ReplyVO> replyList(int board_no) throws Exception;
			
			// ��� �ۼ�
			public void replyWrite(ReplyVO vo) throws Exception;
			
			// ��� ����
			public void replyModify(ReplyVO vo) throws Exception;
			
			// ��� ����
			public void replyDelete(int reply_no)throws Exception;
}
