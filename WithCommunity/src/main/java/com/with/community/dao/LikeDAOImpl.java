package com.with.community.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.LikeVO;

public class LikeDAOImpl implements LikeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.LikeDAO";

	@Override
	public void doLike(LikeVO likeVO) throws Exception {
		sqlSession.insert("namespace.doLike",likeVO);
	}

	@Override
	public int getMyLikeCount(LikeVO likeVO) throws Exception {
		return sqlSession.selectOne("namespace.getMyLikeCount", likeVO);
	}

	@Override
	public void deleteLike(LikeVO likeVO) throws Exception {
		sqlSession.delete("namespace.deleteLike",likeVO);
	}

	@Override
	public int getTotalLikeCount(int board_no) throws Exception {
		return sqlSession.selectOne("namespace.getTotalLikeCount", board_no);
	}
}
