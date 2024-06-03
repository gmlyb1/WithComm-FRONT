package com.with.community.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageVO {
	
	private String msg_no;
	private int msg_room;
	private String send_nick;
	private String recv_nick;
	private String send_time;
	private String read_time;
	private String msg_content;
	private String read_chk;
	
	//현재 사용자의 메세지 상대 nick을 담음
	private String other_nick;
	private String profile;
	private String nick;
	private int unread;
	
}
