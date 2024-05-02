package com.with.community.service;

import java.util.ArrayList;
import java.util.List;

import com.with.community.vo.DateData;
import com.with.community.vo.ScheduleVO;

public interface CalendarService {

	public int schedule_add(ScheduleVO scheduleVO) throws Exception;
	public int before_schedule_add_search(ScheduleVO scheduleVO)throws Exception;
	public ArrayList<ScheduleVO> schedule_list(DateData dateData)throws Exception;
	
	// 수정 , 삭제를 위한 리스트 불러오기 
	// 조회
	public ScheduleVO get(int idx) throws Exception;
	
	// 수정
	public int update(ScheduleVO scheduleVO)throws Exception;
	
	// 삭제
	public int delete(ScheduleVO scheduleVO)throws Exception;
}
