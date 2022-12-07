package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.with.community.dao.BoardDAO;
import com.with.community.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		boardDAO.insertBoard(vo);
	}

	@Override
	public List<BoardVO> BoardList() throws Exception {
		return boardDAO.BoardList();
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

}
