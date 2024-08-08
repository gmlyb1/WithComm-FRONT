package com.with.community.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LikeVO {
	
	private int like_no;
	private int me_id;
	private int board_no;
	private Date like_date;

}