package com.with.community.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.LikeDAO;
import com.with.community.vo.LikeVO;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Inject
	private LikeDAO likeDAO;

	@Override
	public void doLike(LikeVO likeVO) throws Exception {
		likeDAO.doLike(likeVO);
	}

	@Override
	public int getMyLikeCount(LikeVO likeVO) throws Exception {
		return likeDAO.getMyLikeCount(likeVO);
	}

	@Override
	public void deleteLike(LikeVO likeVO) throws Exception {
		likeDAO.deleteLike(likeVO);
	}

	@Override
	public int getTotalLikeCount(int board_no) throws Exception {
		return likeDAO.getTotalLikeCount(board_no);
	}
}
