package com.kosmo.baby.command;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
 
    private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
 
    public SocketHandler (){
        super();
    }
    // 사용자가 나갈경우 불러오는 메소드 웹소켓세션객체에서 리무브한다
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        sessionSet.remove(session);
    }
// 사용자가 웹소켓에 연결되면 불러온다 add 한다
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        super.afterConnectionEstablished(session);
        sessionSet.add(session);
        System.out.println("session:" + session);
        System.out.println("소켓에 연결되서 한명을 추가한다.");
    }
// 사용자가 채팅할 내용을 적고 보내기를 눌르면 불러온다
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        super.handleMessage(session, message);
        sendMessage(message.getPayload().toString());
    }
//에러
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
    }
 
    @Override
    public boolean supportsPartialMessages() {
        return super.supportsPartialMessages();
    }
// 함수를 따로 정의하였다 메세지를 보내는 함수이다 웹소켓에 저장한 사용자들에게 모두다 보낸다
    public void sendMessage (String message){
        for (WebSocketSession session: this.sessionSet){
            if (session.isOpen()){
                try{
                    session.sendMessage(new TextMessage(message));
                }catch (Exception ignored){
//                    this.logger.error("fail to send message!", ignored);
                }
            }
        }
    }
// thread로 현새기각을 클라이언트에게 주기적으로 
    @Override
    public void afterPropertiesSet() throws Exception {
        Thread thread = new Thread(){
            int i=0;
            @Override
            public void run() {
                while (true){
                    try {
                        String json = String.format("{\"type\":\"time\", \"time\":\"%s\"}", System.currentTimeMillis());
                        sendMessage(json);
                        Thread.sleep(300);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                        break;
                    }
                }
            }
        };
 
        thread.start();
    }
}
