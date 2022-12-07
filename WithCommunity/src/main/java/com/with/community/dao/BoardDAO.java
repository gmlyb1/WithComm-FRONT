package com.with.community.dao;

import java.util.List;

import com.with.community.vo.BoardVO;

public interface BoardDAO {

	// 게시글 작성
	public void insertBoard(BoardVO vo) throws Exception;
	
	// 게시글 목록
	public List<BoardVO> BoardList() throws Exception;
	
	// 게시글 조회
	public BoardVO BoardRead(int board_no) throws Exception;
	
	// 게시글 수정
	public void BoardUpdate(BoardVO vo) throws Exception;
	
	// 게시글 삭제
	public void BoardDelete(int board_no) throws Exception;
	
	// 게시글 조회수
	public void BoardHit(int board_no) throws Exception;
}
