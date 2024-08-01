package com.with.community.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.with.community.dao.NoticeDAO;
import com.with.community.util.FileUtils;
import com.with.community.vo.BoardVO;
import com.with.community.vo.Criteria;
import com.with.community.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired(required = false)
	private FileUtils fileUtils;
	
	@Inject
	private NoticeDAO noticeDAO;

	@Override
	public void insertNotice(NoticeVO vo,MultipartHttpServletRequest mpRequest) throws Exception {
		noticeDAO.insertNotice(vo);
		
//		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
//		int size = list.size();
//		for(int i=0; i < size; i++) {
//			noticeDAO.insertFile(list.get(i));
//		}
	}

	@Override
	public List<NoticeVO> NoticeList(Criteria cri) throws Exception {
		return noticeDAO.NoticeList(cri);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeVO NoticeRead(int notice_no) throws Exception {
		noticeDAO.NoticeHit(notice_no);
		return noticeDAO.NoticeRead(notice_no);
	}

	@Override
	public void NoticeUpdate(NoticeVO vo) throws Exception {
		noticeDAO.NoticeUpdate(vo);
	}

	@Override
	public void NoticeDelete(int notice_no) throws Exception {
		noticeDAO.NoticeDelete(notice_no);
	}

	@Override
	public void NoticeHit(int notice_no) throws Exception {
		noticeDAO.NoticeHit(notice_no);
	}

	@Override
	public NoticeVO lastNoticeList(int notice_no) throws Exception {
		return noticeDAO.lastNoticeList(notice_no);
	}

	@Override
	public NoticeVO nextNoticeList(int notice_no) throws Exception {
		return noticeDAO.nextNoticeList(notice_no);
	}

	@Override
	public int getListCount(Criteria cri) throws Exception {
		return noticeDAO.getListCount(cri);
	}

	@Override
	public List<NoticeVO> selectNoticeImportant(NoticeVO vo) throws Exception {
		return noticeDAO.selectNoticeImportant(vo);
	}

	@Override
	public List<NoticeVO> HomeNoticeList() throws Exception {
		return noticeDAO.HomeNoticeList();
	}
	

}
