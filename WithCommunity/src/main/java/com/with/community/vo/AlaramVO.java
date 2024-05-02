package com.with.community.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlaramVO {

	private int idx;
	private int me_id;
	private String code;
	private String checked;
	private Date create_date;
	private String prefix;
}
