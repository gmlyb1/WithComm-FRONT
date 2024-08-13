package com.with.community.service;

import java.util.List;

import com.with.community.vo.AlaramVO;

public interface AlaramService {

	public List<AlaramVO> selectAlaram(String hsid);
}
