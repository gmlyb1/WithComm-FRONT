package com.with.community.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.with.community.vo.AccountVO;


@Component
@RequestMapping("/alarm")
public class AlarmHandler extends TextWebSocketHandler{

	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	private Map<String, WebSocketSession> userSessionMap = new HashMap<String,WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		logger.info("socket 연결");
		sessions.add(session);
		logger.info(currentUserName(session)); //현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionMap.put(senderId, session);
	
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("session"+currentUserName(session));
		String msg = message.getPayload();
		logger.info("msg:"+msg);
		
		if(StringUtils.isNotEmpty(msg)) {
			logger.info("if 문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 6) {
				String cmd = strs[0];
				String reply_writer = strs[1];
				String board_writer = strs[2];
				String board_no = strs[3];
				String board_title = strs[4];
				String board_bgno = strs[5];
				logger.info("length 성공?"+cmd);
				
				WebSocketSession replyWriterSession = userSessionMap.get(reply_writer);
				WebSocketSession boardWriterSession = userSessionMap.get(board_writer);
				logger.info("replyWriterSession:"+userSessionMap.get(reply_writer));
				logger.info("boardWriterSession:"+userSessionMap.get(board_writer));
				
				
				//댓글
				if("reply".equals(cmd) && boardWriterSession != null) {
					logger.info("onMessage 되냐?");
					TextMessage tmpMsg = new TextMessage(reply_writer + "님이"
							+ "<a href='/board/read?board_no="+board_no+"&board_bgno="+board_bgno+"' style=\"color: black\">"
							+ board_title+ "에 댓글을 달았습니다!</a>");
					boardWriterSession.sendMessage(tmpMsg);
				}
				
				
			}
		}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("socket 끊음");
		sessions.remove(session);
		userSessionMap.remove(currentUserName(session),session);
	}
	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		AccountVO loginUser = (AccountVO)httpSession.get("member");
		
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		int meId = loginUser.getMe_id();
		String mid = String.valueOf(meId);
		return mid;
	} 
}
