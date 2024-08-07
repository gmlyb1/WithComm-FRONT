package com.with.community.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.with.community.vo.Criteria;
import com.with.community.vo.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.NoticeDAO";

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		sqlSession.insert("namespace.insertNotice", vo);
	}

	@Override
	public List<NoticeVO> NoticeList(Criteria cri) throws Exception {
		
		
		return sqlSession.selectList("namespace.NoticeList",cri);
	}

	@Override
	public NoticeVO NoticeRead(int notice_no) throws Exception {
		return sqlSession.selectOne("namespace.NoticeRead", notice_no);
	}

	@Override
	public void NoticeUpdate(NoticeVO vo) throws Exception {
		sqlSession.update("namespace.NoticeUpdate",vo);
	}

	@Override
	public void NoticeDelete(int notice_no) throws Exception {
		sqlSession.update("namespace.NoticeDelete",notice_no);
	}

	@Override
	public void NoticeHit(int notice_no) throws Exception {
		sqlSession.update("namespace.NoticeHit", notice_no);
			
	}

	@Override
	public NoticeVO lastNoticeList(int notice_no) throws Exception {
		return sqlSession.selectOne("namespace.lastNoticeList",notice_no);
	}

	@Override
	public NoticeVO nextNoticeList(int notice_no) throws Exception {
		return sqlSession.selectOne("namespace.nextNoticeList", notice_no);
	}

	@Override
	public int getListCount(Criteria cri) throws Exception {
		return sqlSession.selectOne("namespace.getListCount",cri);
	}

	@Override
	public List<NoticeVO> selectNoticeImportant(NoticeVO vo) throws Exception {
		return sqlSession.selectList("namespace.selectNoticeImportant", vo);
	}

	@Override
	public List<NoticeVO> HomeNoticeList() throws Exception {
		return sqlSession.selectList("namespace.HomeNoticeList");
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("namespace.insertFile",map);
	}



	
	

}
