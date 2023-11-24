package com.with.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.BoardVO;
import com.with.community.vo.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.with.community.dao.ReplyDAO";

	@Override
	public List<ReplyVO> replyList(int board_no) throws Exception {
		return sqlSession.selectList("namespace.replyList", board_no);
	}

	@Override
	public void replyWrite(ReplyVO vo) throws Exception {
		sqlSession.insert("namespace.replyWrite", vo);
	}

	@Override
	public void replyModify(ReplyVO vo) throws Exception {
		sqlSession.update("namespace.replyModify", vo);
	}

	@Override
	public void replyDelete(int reply_no) throws Exception {
		sqlSession.delete("namespace.replyDelete", reply_no);
	}

	@Override
	public void replyUpdate(BoardVO bvo) throws Exception {
		sqlSession.update("namespace.replyUpdate", bvo);
	}
	
	// 버튼 댓글 수정
	@Override
	public void modifyReply(int reply_no,String edited_content) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("edited_content", edited_content);
		paramMap.put("reply_no", reply_no);
		
		
		sqlSession.update("namespace.modifyReply",paramMap);
	}
}
