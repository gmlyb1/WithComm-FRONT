package com.with.community.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.with.community.vo.AccountVO;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

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
		logger.info("ssesion"+currentUserName(session));
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		logger.info("msg="+msg);
		
		if (StringUtils.isNotEmpty(msg)) {
			logger.info("if문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 6) {
				
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String board_no = strs[3];
				String board_title = strs[4];
				String board_bgno = strs[5];
				logger.info("length 성공?"+cmd);
				
				WebSocketSession replyWriterSession = userSessionsMap.get(replyWriter);
				WebSocketSession boardWriterSession = userSessionsMap.get(boardWriter);
				logger.info("boardWriterSession="+userSessionsMap.get(boardWriter));
				logger.info("boardWirterSession"+boardWriterSession);
				
				//댓글
				if ("reply".equals(cmd) && boardWriterSession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
							+ "<a href='/board/read?board_no="+ board_no +"&board_bgno="+board_bgno+"'  style=\"color: black\">"
							+ board_title+" 에 댓글을 달았습니다!</a>");
					boardWriterSession.sendMessage(tmpMsg);
				}
				
				//스크랩
				else if("scrap".equals(cmd) && boardWriterSession != null) {
					//replyWriter = 스크랩누른사람 , boardWriter = 게시글작성자
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
							+ "<a href='/board/read?board_no=" + board_no + "&board_bgno="+board_bgno+"'  style=\"color: black\"><strong>"
							+ board_title+"</strong> 에 작성한 글을 스크랩했습니다!</a>");

					boardWriterSession.sendMessage(tmpMsg);
					
				}
				
				//좋아요
				else if("like".equals(cmd) && boardWriterSession != null) {
					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
							+ "<a href='/board/read?board_no=" + board_no + "&bgno="+board_bgno+"'  style=\"color: black\"><strong>"
							+ board_title+"</strong> 에 작성한 글을 좋아요했습니다!</a>");

					boardWriterSession.sendMessage(tmpMsg);
					
				}
				
				//DEV
				else if("Dev".equals(cmd) && boardWriterSession != null) {
					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
							+ "<a href='/board/read?bno=" + board_no + "&bgno="+board_bgno+"'  style=\"color: black\"><strong>"
							+ board_title+"</strong> 에 작성한 글을 DEV했습니다!</a>");

					boardWriterSession.sendMessage(tmpMsg);
					
				}
				
				//댓글채택
				else if("questionCheck".equals(cmd) && replyWriterSession != null) {
					//replyWriter = 댓글작성자 , boardWriter = 글작성자
					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
							+ "<a href='/board/read?board_no=" + board_no + "&board_bgno="+board_bgno+"'  style=\"color: black\"><strong>"
							+ board_title+"</strong> 에 작성한 댓글을 채택했습니다!</a>");

					replyWriterSession.sendMessage(tmpMsg);
					
				}
				
				//댓글좋아요
				else if("commentLike".equals(cmd) && replyWriterSession != null) {
					logger.info("좋아요onmessage되나?");
					logger.info("result=board="+boardWriter+"//"+replyWriter+"//"+board_no+"//"+board_bgno+"//"+board_title);
					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
							+ "<a href='/board/read?board_no=" + board_no + "&board_bgno="+board_bgno+"'  style=\"color: black\"><strong>"
							+ board_title+"</strong> 에 작성한 댓글을 추천했습니다!</a>");

					replyWriterSession.sendMessage(tmpMsg);
				}
				
				
				//댓글DEV
				else if("commentDev".equals(cmd) && replyWriterSession != null) {
					logger.info("좋아요onmessage되나?");
					logger.info("result=board="+boardWriter+"//"+replyWriter+"//"+board_no+"//"+board_bgno+"//"+board_title);
					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
							+ "<a href='/board/read?board_no=" + board_no + "&board_bgno="+board_bgno+"'  style=\"color: black\"><strong>"
							+ board_title+"</strong> 에 작성한 댓글을 DEV했습니다!</a>");

					replyWriterSession.sendMessage(tmpMsg);
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
		AccountVO loginUser = (AccountVO)httpSession.get("login");
		
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getMe_email();
		return mid;
		
	}
}
