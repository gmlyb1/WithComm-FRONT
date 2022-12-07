package com.with.community.service;

import java.util.List;

import com.with.community.vo.BoardVO;

public interface BoardService {

	// �Խñ� �ۼ�
		public void insertBoard(BoardVO vo) throws Exception;
		
		// �Խñ� ���
		public List<BoardVO> BoardList() throws Exception;
		
		// �Խñ� ��ȸ
		public BoardVO BoardRead(int board_no) throws Exception;
		
		// �Խñ� ����
		public void BoardUpdate(BoardVO vo) throws Exception;
		
		// �Խñ� ����
		public void BoardDelete(int board_no) throws Exception;
		
		// �Խñ� ��ȸ��
		public void BoardHit(int board_no) throws Exception;
}
