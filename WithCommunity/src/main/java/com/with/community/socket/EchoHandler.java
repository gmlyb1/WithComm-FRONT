package com.with.community.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.with.community.dao.AlaramDAO;
import com.with.community.vo.AccountVO;
import com.with.community.vo.AlaramVO;

@Component
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

	@Autowired 
	private AlaramDAO alaramDAO;
	
	public void setAlarmDao(AlaramDAO alaramDAO) {
		this.alaramDAO = alaramDAO;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		logger.info("Socket 연결");
		sessions.add(session);
		logger.info(currentUserName(session));//현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		for(WebSocketSession single : sessions) {
			
			// 세션아이디 
			String hsid = (String)single.getAttributes().get("member");
			
			//세션값이 같을때, 알람보낼 것이 있을 때만 전송 -> 로그인 한 사용자가 처음으로 알람 받는 순간임
	        //해당 sendMsg에 DB정보 넣어서 체크 안된 알람 전부 전송하기
			if(single.getAttributes().get("member").equals(session.getAttributes().get("member"))) {
				List<AlaramVO> aVO = new ArrayList<>();
				aVO = alaramDAO.selectAlarm(hsid);
				
				for(AlaramVO alaram : aVO) {
					int idx = alaram.getIdx();
					String prefix = alaram.getPrefix();
					String code = alaram.getCode();
					if(code.equals("NewPost")) {
						code = "답변이 등록되었습니다.";
					}
					TextMessage sendMsg = new TextMessage("("+idx+")" + prefix + "에 " + code);
					single.sendMessage(sendMsg);
				}
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		AccountVO loginUser = (AccountVO)httpSession.get("member");
		
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getMe_email();
		return mid;
		
	}
}
