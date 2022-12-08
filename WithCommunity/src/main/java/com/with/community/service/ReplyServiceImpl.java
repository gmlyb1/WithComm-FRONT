package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.ReplyDAO;
import com.with.community.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO replyDAO;

	@Override
	public List<ReplyVO> replyList(int board_no) throws Exception {
		return replyDAO.replyList(board_no);
	}

	@Override
	public void replyWrite(ReplyVO vo) throws Exception {
		replyDAO.replyWrite(vo);
	}

	@Override
	public void replyModify(ReplyVO vo) throws Exception {
		replyDAO.replyModify(vo);
	}

	@Override
	public void replyDelete(int reply_no) throws Exception {
		replyDAO.replyDelete(reply_no);
	}
}
