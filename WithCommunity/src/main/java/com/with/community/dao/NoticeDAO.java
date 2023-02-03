package com.with.community.dao;

import java.util.List;

import com.with.community.vo.NoticeVO;
import com.with.community.vo.PageInfo;

public interface NoticeDAO {

	public NoticeVO lastNoticeList(int notice_no) throws Exception;
			
	public NoticeVO nextNoticeList(int notice_no) throws Exception;
	
	public void insertNotice(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> NoticeList(PageInfo paging) throws Exception;
	
	public NoticeVO NoticeRead(int notice_no) throws Exception;
	
	public void NoticeUpdate(NoticeVO vo) throws Exception;
	
	public void NoticeDelete(int notice_no) throws Exception;
	
	public void NoticeHit(int notice_no) throws Exception;
	
	public int getListCount() throws Exception;
}
