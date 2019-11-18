package kr.co.petmee.websocket.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("test01")
public class Test01Handler extends TextWebSocketHandler{
   
   public Test01Handler() {
      System.out.println("Test01Handler 객체 생성");
   }

   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      System.out.println(session.getId() + " 연결 되었음");
   }

   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      System.out.println("보낸 아이디 : " + session.getId());
      System.out.println("보낸 데이터 : " + message.getPayload());
      session.sendMessage(new TextMessage("에코 메세지 : " + message.getPayload()));
   }

   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      System.out.println(session.getId() + " 연결종료됨");
   }
   
}