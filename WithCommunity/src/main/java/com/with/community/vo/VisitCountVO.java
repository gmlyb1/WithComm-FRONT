package com.with.community.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VisitCountVO {
	
	private int visit_id;
	//private String me_email;
	private String regDate;
	private int visitCount;
	
	private int day;
	private int week;
	private int month;
	private int year;
	
	private int yesterday_diff;
	private int day_diff;
	private int last_week_diff;
	private int week_diff;
	private int last_month_diff;
	private int month_diff;
	private int last_year_diff;
	private int year_diff;

}
