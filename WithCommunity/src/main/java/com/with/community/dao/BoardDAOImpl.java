package com.with.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.BoardVO;
import com.with.community.vo.PageInfo;

public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.BoardDAO";
	
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		sqlSession.insert("namespace.insertBoard", vo);
	}

	@Override
	public List<BoardVO> BoardList(PageInfo paging) throws Exception {
		
		int offset = (paging.getCurrentPage() - 1) * paging.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, paging.getBoardLimit());
		
		return (List)sqlSession.selectList("namespace.BoardList",null,rowBounds);
	}

	@Override
	public BoardVO BoardRead(int board_no) throws Exception {
		return sqlSession.selectOne("namespace.BoardRead", board_no);
	}

	@Override
	public void BoardUpdate(BoardVO vo) throws Exception {
		sqlSession.update("namespace.BoardUpdate", vo);
	}

	@Override
	public void BoardDelete(int board_no) throws Exception {
		sqlSession.delete("namespace.BoardDelete", board_no);
	}

	@Override
	public void BoardHit(int board_no) throws Exception {
		sqlSession.update("namespace.BoardHit",board_no);
	}

	@Override
	public BoardVO lastBoardList(int board_no) throws Exception {
		
		return sqlSession.selectOne("namespace.lastBoardList", board_no);
	}

	@Override
	public BoardVO nextBoardList(int board_no) throws Exception {
		
		return sqlSession.selectOne("namespace.nextBoardList", board_no);
	}

	@Override
	public int getListCount() throws Exception {
		return sqlSession.selectOne("namespace.getListCount");
	}

	@Override
	public void updateReplyCount(int board_no) throws Exception {
		sqlSession.update("namespace.updateReplyCount", board_no);
		
	}
}
