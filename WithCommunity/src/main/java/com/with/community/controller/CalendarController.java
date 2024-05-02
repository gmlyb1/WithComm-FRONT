package com.with.community.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.with.community.dao.CalendarDAO;
import com.with.community.service.CalendarService;
import com.with.community.vo.DateData;
import com.with.community.vo.ScheduleVO;

@Controller
@RequestMapping(value = "/calendar/*")
public class CalendarController {

	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	private CalendarService calendarService;
	
	private final static Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData) throws Exception 
	{
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		//검색 날짜
		if(dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)), String.valueOf(cal.get(Calendar.DATE)),null,null);
		}
		
		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		// 검색 날짜 and
		CalendarDAO calendarDAO = sqlSession.getMapper(CalendarDAO.class);
		ArrayList<ScheduleVO> Schedule_list = calendarDAO.schedule_list(dateData);
		
		// 달력 데이터에 넣기 위한 배열 추가
		ScheduleVO[][] schedule_data_arr = new ScheduleVO[32][4];
		if(Schedule_list.isEmpty() != true) {
			int j = 0;
			for(int i=0; i <Schedule_list.size(); i++) {
				int date = Integer.parseInt(String.valueOf(Schedule_list.get(i).getSchedule_date()).substring(String.valueOf(Schedule_list.get(i).getSchedule_date()).length()-2,String.valueOf(Schedule_list.get(i).getSchedule_date()).length()));
				
			if(i > 0) {
				int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i - 1).getSchedule_date()).substring(String.valueOf(Schedule_list.get(i-1).getSchedule_date()).length()-2,String.valueOf(Schedule_list.get(i-1).getSchedule_date()).length()));
			
				if(date_before == date) {
					j = j + 1;
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}else {
					j = 0;
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}
			
			}else {
				schedule_data_arr[date][j] = Schedule_list.get(i);
			}
			
			
		}
	}
		
		// 실질적인 달력 데이터 리스트에 데이터 삽입 시작
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i< today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null, null);
			dateList.add(calendarData);
		}
		
		// 날짜 삽입
		for(int i = today_info.get("startDay"); i<= today_info.get("endDay"); i++) {
			ScheduleVO[] schedule_data_arr3 = new ScheduleVO[4];
			schedule_data_arr3 = schedule_data_arr[i];
			
			if(i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today", schedule_data_arr3);
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date", schedule_data_arr3);
			}
			dateList.add(calendarData);
				
		}
		
		//달력 빈 곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;
		if(dateList.size() % 7 != 0) {
			for(int i=0; i < index; i++) {
				calendarData = new DateData(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		// 배열에 담음
		model.addAttribute("dateList", dateList);
		model.addAttribute("today_info", today_info);
		
		return "/calendar/index";
	}
	
	
	@RequestMapping(value = "/add" ,method= RequestMethod.GET)
	public String schedule_add(HttpServletRequest request, ScheduleVO vo, RedirectAttributes rttr) throws Exception {
			
		CalendarDAO calendarDAO = sqlSession.getMapper(CalendarDAO.class);
		int count = calendarDAO.before_schedule_add_search(vo);
		String msg = "";
		String url = "redirect:/calendar/index";
		
		if(count >= 4) {
			msg = "스케줄은 최대 4개만 등록 가능합니다.";
		}else {
			calendarDAO.schedule_add(vo);
			msg = "스케줄이 등록되었습니다.";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return url;
	}
	
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String schedule_show(Model model , HttpServletRequest request, @RequestParam("schedule_idx") int idx, RedirectAttributes rttr) throws Exception
	{
		CalendarDAO calendarDAO = sqlSession.getMapper(CalendarDAO.class);
		
		String url = "redirect:/calendar/index";
		
		calendarDAO.get(idx);
		
		model.addAttribute("show", calendarDAO.get(idx));
		
		return null;
	}
	
	
	@RequestMapping(value = "/modify" , method = RequestMethod.GET) 
	public String schedule_modify(Model model, HttpServletRequest request, ScheduleVO scheduleVO) throws Exception
	{
		CalendarDAO calDAO = sqlSession.getMapper(CalendarDAO.class);
		
		calDAO.update(scheduleVO);
		
		model.addAttribute("modify", calDAO.update(scheduleVO));
		
		return "/calendar/modify";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String schedule_delete(Model model, HttpServletRequest request, ScheduleVO scheduleVO) throws Exception
	{
		CalendarDAO calendarDAO = sqlSession.getMapper(CalendarDAO.class);
		
		calendarDAO.delete(scheduleVO);
		
		model.addAttribute("delete", calendarDAO.delete(scheduleVO));
		return null;
	}
}
