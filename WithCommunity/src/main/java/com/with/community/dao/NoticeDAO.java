package com.with.community.dao;

import java.util.List;

import com.with.community.vo.NoticeVO;

public interface NoticeDAO {

	// 공지사항 작성
	public void insertNotice(NoticeVO vo) throws Exception;
	
	// 공지사항 목록
	public List<NoticeVO> NoticeList() throws Exception;
	
	// 공지사항 조회
	public NoticeVO NoticeRead(int notice_no) throws Exception;
	
	// 공지사항 수정
	public void NoticeUpdate(NoticeVO vo) throws Exception;
	
	// 공지사항 삭제
	public void NoticeDelete(int notice_no) throws Exception;
	
	// 공지사항 조회수
	public void NoticeHit(int notice_no) throws Exception;
}
