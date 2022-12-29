package com.with.community.service;

import java.util.List;

import com.with.community.vo.NoticeVO;

public interface NoticeService {

	// 이전글
	public NoticeVO lastNoticeList(int notice_no) throws Exception;
		
	// 다음글
	public NoticeVO nextNoticeList(int notice_no) throws Exception;
	
	// 게시글 작성
	public void insertNotice(NoticeVO vo) throws Exception;
	
	// 게시글 목록
	public List<NoticeVO> NoticeList() throws Exception;
	
	// 게시글 조회
	public NoticeVO NoticeRead(int notice_no) throws Exception;
	
	// 게시글 수정
	public void NoticeUpdate(NoticeVO vo) throws Exception;
	
	// 게시글 삭제
	public void NoticeDelete(int notice_no) throws Exception;
	
	// 게시글 조회수
	public void NoticeHit(int notice_no) throws Exception;
}
