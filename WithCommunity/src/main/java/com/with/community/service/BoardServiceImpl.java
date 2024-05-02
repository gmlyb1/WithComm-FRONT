package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.with.community.dao.BoardDAO;
import com.with.community.vo.BoardVO;
import com.with.community.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public BoardVO lastBoardList(int board_no) throws Exception {

		return boardDAO.lastBoardList(board_no);
	}

	@Override
	public BoardVO nextBoardList(int board_no) throws Exception {

		return boardDAO.nextBoardList(board_no);
	}
	
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		boardDAO.insertBoard(vo);
	}

	@Override
	public List<BoardVO> BoardList(Criteria cri) throws Exception {
		return boardDAO.BoardList(cri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO BoardRead(int board_no) throws Exception {
		
		boardDAO.BoardHit(board_no);
		return boardDAO.BoardRead(board_no);
	}

	@Override
	public void BoardUpdate(BoardVO vo) throws Exception {
		boardDAO.BoardUpdate(vo);
	}

	@Override
	public void BoardDelete(int board_no) throws Exception {
		boardDAO.BoardDelete(board_no);
	}

	@Override
	public void BoardHit(int board_no) throws Exception {
		boardDAO.BoardHit(board_no);
	}

	@Override
	public int getListCount(Criteria cri) throws Exception {
		return boardDAO.getListCount(cri);
	}

	@Override
	public void updateReplyCount(int board_no) throws Exception {
		boardDAO.updateReplyCount(board_no);
	}

	@Override
	public List<BoardVO> HomeBoardList() throws Exception {
		return boardDAO.HomeBoardList();
	}

}
