package mc.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import mc.chat.model.MessageDto;
import mc.chat.service.ChatService;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	ChatService service;
	// ���ȣ, ä�ÿ� �������� webSocketSession������ map
	private Map<String, List<WebSocketSession>> sessionMap = new TreeMap<String, List<WebSocketSession>>();

	// ä�ù� ù ����, ä�ù� �޼��� ���۽� ����
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		int index = message.getPayload().indexOf(",");
		int index2 = message.getPayload().indexOf(",", index + 1);
		String chat_no = message.getPayload().substring(0, index);
		String employee_no = message.getPayload().substring(index + 1, index2);
		String idMsg = message.getPayload().substring(index2 + 1);
		index = idMsg.indexOf(":");
		String name = idMsg.substring(0, index);
		String msg = idMsg.substring(index + 1);

		if (msg.equals("")) {
			if (sessionMap.containsKey(chat_no)) {
				sessionMap.get(chat_no).add(session);
			} else {
				List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
				sessionList.add(session);
				sessionMap.put(chat_no, sessionList);
			}
		} else {
			// ������ ä�ù濡 �ִ� ��� ����ڿ��� �޼��� ����
			for (WebSocketSession sess : sessionMap.get(chat_no)) {
				sess.sendMessage(new TextMessage(employee_no + "," + idMsg));
			}
			MessageDto dto = new MessageDto();
			dto.setChat_no(Integer.parseInt(chat_no));
			if (name.equals("-1") || name.equals("-2")) {
				dto.setEmployee_no(0);
			} else {
				dto.setEmployee_no(Integer.parseInt(employee_no));
			} 
			dto.setContents(idMsg);
			service.insertMessage(dto);
		}
	}

	// ä�ù� ����, ����� ����
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// sessionList.remove(session);
		EXIT: for (String key : sessionMap.keySet()) {
			for (WebSocketSession sess : sessionMap.get(key)) {
				if (sess.equals(session)) {
					sessionMap.get(key).remove(session);
					break EXIT;
				}
			}
		}
	}
}
