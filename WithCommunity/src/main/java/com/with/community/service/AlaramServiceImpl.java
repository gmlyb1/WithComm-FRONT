package com.with.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.AlaramDAO;
import com.with.community.vo.AlaramVO;

@Service
public class AlaramServiceImpl implements AlaramService {

	@Inject
	private AlaramDAO alaramDAO;

	@Override
	public List<AlaramVO> selectAlaram(String hsid){
		return alaramDAO.selectAlarm(hsid);
	}
}
