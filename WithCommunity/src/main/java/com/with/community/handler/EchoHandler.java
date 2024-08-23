package com.with.community.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.with.community.service.MessageService;
import com.with.community.vo.AccountVO;

public class EchoHandler extends TextWebSocketHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	@Autowired
	private MessageService messageService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String user_name = searchUserName(session);
//		logger.info("user_name:"+user_name);
		sessionList.add(session);
		session.sendMessage(new TextMessage("recMs : " + messageService.countMessageView(user_name)));
//		logger.info("recMs: " + messageService.countMessageView(user_name));
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String user_name = searchUserName(session);
		
		for(WebSocketSession sess : sessionList) {
				sess.sendMessage(new TextMessage(user_name+":"+message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		String user_name = searchUserName(session);
//		logger.info("연결 끊어짐");
//		for(WebSocketSession sess: sessionList) {
//			
//			sess.sendMessage(new TextMessage(user_name+" 님의 연결이 끊어졌습니다."));
//		}
//		
//		sessionList.remove(session);
		
		 String user_name = null;
		    try {
		        user_name = searchUserName(session);
		    } catch (Exception e) {
		        logger.error("Error retrieving user name during afterConnectionClosed: " + e.getMessage(), e);
		    }
		    
//		    logger.info("연결 끊어짐: " + (user_name != null ? user_name : "Unknown user"));

		    // Iterate over a copy of the session list to avoid ConcurrentModificationException
		    List<WebSocketSession> sessionsToRemove = new ArrayList<>();
		    
		    for (WebSocketSession sess : sessionList) {
		        if (sess.isOpen()) {
		            try {
		                if (user_name != null) {
		                    sess.sendMessage(new TextMessage(user_name + " 님의 연결이 끊어졌습니다."));
		                }
		            } catch (Exception e) {
		                logger.error("Error sending disconnect message to session: " + e.getMessage(), e);
		                sessionsToRemove.add(sess); // Collect sessions to remove
		            }
		        } else {
		            sessionsToRemove.add(sess); // Collect closed sessions to remove
		        }
		    }

		    // Remove sessions outside of the iteration loop
		    sessionList.removeAll(sessionsToRemove);
	}
	
	public String searchUserName(WebSocketSession session) throws Exception {
		String user_name;
		Map<String, Object> map;
		map = session.getAttributes();
		AccountVO account = (AccountVO) map.get("member");
		user_name = (account != null) ? account.getMe_email() : null;
//		logger.info("여기서는?:"+user_name);
		return user_name;
	}
}
