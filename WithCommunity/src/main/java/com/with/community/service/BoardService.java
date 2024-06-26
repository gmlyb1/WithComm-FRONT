package com.with.community.service;

import java.util.List;

import com.with.community.vo.BoardVO;
import com.with.community.vo.Criteria;

public interface BoardService {

	public BoardVO lastBoardList(int board_no) throws Exception;

	public BoardVO nextBoardList(int board_no) throws Exception;

	public void insertBoard(BoardVO vo) throws Exception;

	public List<BoardVO> BoardList(Criteria cri) throws Exception;

	public BoardVO BoardRead(int board_no) throws Exception;

	public void BoardUpdate(BoardVO vo) throws Exception;

	public void BoardDelete(int board_no) throws Exception;

	public void BoardHit(int board_no) throws Exception;
	
	public int getListCount(Criteria cri) throws Exception;
	
	public void updateReplyCount(int board_no) throws Exception;
	
	public List<BoardVO> HomeBoardList() throws Exception;
}
