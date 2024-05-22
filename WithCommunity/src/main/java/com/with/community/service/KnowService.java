package com.with.community.service;

import java.util.List;

import com.with.community.vo.Criteria;
import com.with.community.vo.KnowVO;

public interface KnowService {

	public List<KnowVO> KnowList(Criteria cri) throws Exception;
	
	public int getListCount(Criteria cri) throws Exception;
	
	public KnowVO KnowRead(int know_no) throws Exception;

	public void insertKnow(KnowVO vo) throws Exception;
	
	public void updateKnow(KnowVO vo) throws Exception;
	
	public void deleteKnow(int know_no) throws Exception;
}
