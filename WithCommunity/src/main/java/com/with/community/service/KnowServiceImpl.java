package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.KnowDAO;
import com.with.community.vo.Criteria;
import com.with.community.vo.KnowVO;

@Service
public class KnowServiceImpl implements KnowService{

	@Inject
	private KnowDAO knowDAO;

	@Override
	public List<KnowVO> KnowList(Criteria cri) throws Exception {
		return knowDAO.KnowList(cri);
	}

	@Override
	public int getListCount(Criteria cri) throws Exception {
		return knowDAO.getListCount(cri);
	}
	
	@Override
	public KnowVO KnowRead(int know_no) throws Exception {
		return knowDAO.KnowRead(know_no);
	}
	

	@Override
	public void insertKnow(KnowVO vo) throws Exception {
		knowDAO.insertKnow(vo);
	}

	@Override
	public void updateKnow(KnowVO vo) throws Exception {
		knowDAO.updateKnow(vo);
	}

	@Override
	public void deleteKnow(int know_no) throws Exception {
		knowDAO.deleteKnow(know_no);
	}


}
