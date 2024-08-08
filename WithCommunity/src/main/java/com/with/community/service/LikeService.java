package com.with.community.service;

import com.with.community.vo.LikeVO;

public interface LikeService {

	public void doLike(LikeVO likeVO) throws Exception;
	
	public int getMyLikeCount(LikeVO likeVO) throws Exception;
	
	public void deleteLike(LikeVO likeVO) throws Exception;
	
	public int getTotalLikeCount(int board_no) throws Exception;
	
	
	
}
