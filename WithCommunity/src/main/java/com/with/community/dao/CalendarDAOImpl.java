package com.with.community.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.DateData;
import com.with.community.vo.ScheduleVO;

public class CalendarDAOImpl implements CalendarDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.CalendDAO";

	@Override
	public int schedule_add(ScheduleVO scheduleVO) throws Exception {
		return sqlSession.insert("namespace.shcedule_add");
	}

	@Override
	public int before_schedule_add_search(ScheduleVO scheduleVO) throws Exception {
		return sqlSession.selectOne("namespace.before_schedule_add_search", scheduleVO);
	}

	@Override
	public ArrayList<ScheduleVO> schedule_list(DateData dateData) throws Exception {
	    return sqlSession.selectOne("namespace.schedule_list", dateData);
	}


	@Override
	public ScheduleVO get(int idx) throws Exception {
		return (ScheduleVO) sqlSession.selectList("namespace.get",idx);
	}

	@Override
	public int update(ScheduleVO scheduleVO) throws Exception {
		return sqlSession.update("namespace,update",scheduleVO);
	}

	@Override
	public int delete(ScheduleVO scheduleVO) throws Exception {
		return sqlSession.delete("namespace.delete",scheduleVO);
	}

	
	
}
