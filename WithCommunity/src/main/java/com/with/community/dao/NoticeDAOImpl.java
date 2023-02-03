package com.with.community.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.NoticeVO;
import com.with.community.vo.PageInfo;

public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.NoticeDAO";

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		sqlSession.insert("namespace.insertNotice", vo);
	}

	@Override
	public List<NoticeVO> NoticeList(PageInfo paging) throws Exception {
		
		int offset = (paging.getCurrentPage() - 1) * paging.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, paging.getBoardLimit());
		
		return (List)sqlSession.selectList("namespace.NoticeList",null,rowBounds);
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
		sqlSession.delete("namespace.NoticeDelete",notice_no);
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
	public int getListCount() throws Exception {
		return sqlSession.selectOne("namespace.getListCount");
	}



	
	

}
