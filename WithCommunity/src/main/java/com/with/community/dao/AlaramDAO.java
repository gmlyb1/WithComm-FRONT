package com.with.community.dao;

import java.util.List;

import com.with.community.vo.AlaramVO;

public interface AlaramDAO {


	public List<AlaramVO> selectAlarm(String hsid);



}
