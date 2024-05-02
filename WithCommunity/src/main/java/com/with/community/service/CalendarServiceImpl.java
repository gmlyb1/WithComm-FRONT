package com.with.community.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.CalendarDAO;
import com.with.community.vo.DateData;
import com.with.community.vo.ScheduleVO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject
	private CalendarDAO calendarDAO;

	@Override
	public int schedule_add(ScheduleVO scheduleVO) throws Exception {
		// TODO Auto-generated method stub
		return calendarDAO.schedule_add(scheduleVO);
	}

	@Override
	public int before_schedule_add_search(ScheduleVO scheduleVO) throws Exception {
		// TODO Auto-generated method stub
		return calendarDAO.before_schedule_add_search(scheduleVO);
	}

	@Override
	public ArrayList<ScheduleVO> schedule_list(DateData dateData) throws Exception {
		// TODO Auto-generated method stub
		return calendarDAO.schedule_list(dateData);
	}

	@Override
	public ScheduleVO get(int idx) throws Exception {
		// TODO Auto-generated method stub
		return calendarDAO.get(idx);
	}

	@Override
	public int update(ScheduleVO scheduleVO) throws Exception {
		// TODO Auto-generated method stub
		return calendarDAO.update(scheduleVO);
	}

	@Override
	public int delete(ScheduleVO scheduleVO) throws Exception {
		// TODO Auto-generated method stub
		return calendarDAO.delete(scheduleVO);
	}
	
	
	
	
	
}
