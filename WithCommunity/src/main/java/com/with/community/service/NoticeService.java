package com.with.community.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.with.community.vo.Criteria;
import com.with.community.vo.NoticeVO;

public interface NoticeService {

	public NoticeVO lastNoticeList(int notice_no) throws Exception;
		
	public NoticeVO nextNoticeList(int notice_no) throws Exception;
	
	public void insertNotice(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> NoticeList(Criteria cri) throws Exception;
	
	public NoticeVO NoticeRead(int notice_no) throws Exception;
	
	public void NoticeUpdate(NoticeVO vo) throws Exception;
	
	public void NoticeDelete(int notice_no) throws Exception;
	
	public void NoticeHit(int notice_no) throws Exception;

	public int getListCount(Criteria cri) throws Exception;
	
	public List<NoticeVO> HomeNoticeList() throws Exception;
	
	public List<NoticeVO> selectNoticeImportant(NoticeVO vo) throws Exception;
}
