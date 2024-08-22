package com.with.community.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.with.community.handler.EchoHandler;

public class WebSocketConfig implements WebSocketConfigurer{

	@Autowired
	private EchoHandler echoHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(echoHandler, "/echo").setAllowedOrigins("*")
		.withSockJS()
		.setClientLibraryUrl("https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js")
		.setInterceptors(new HttpSessionHandshakeInterceptor());
	}

}
