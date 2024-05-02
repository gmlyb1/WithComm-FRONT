package com.with.community.vo;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ScheduleVO {

	private int schedule_idx;
	private int schedule_num;
	private String schedule_subject;
	private String schedule_desc;
	private Date schedule_date;
	private String schedule_share;
	private String schedule_mycolor;
}
