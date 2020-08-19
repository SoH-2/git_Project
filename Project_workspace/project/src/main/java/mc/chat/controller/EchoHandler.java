package mc.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	// ���� ����Ʈ
	// private List<WebSocketSession> sessionList = new
	// ArrayList<WebSocketSession>();
	private Map<String, List<WebSocketSession>> sessionMap = new TreeMap<String, List<WebSocketSession>>();
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// Ŭ���̾�Ʈ�� ���� �Ǿ��� �� ����
	/*
	 * @Override public void afterConnectionEstablished(WebSocketSession session)
	 * throws Exception { sessionList.add(session); logger.info("{} �����",
	 * session.getId()); }
	 */

	// Ŭ���̾�Ʈ�� ������ ������ �޽����� �������� �� ����
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}�� ���� {} ����", session.getId(), message.getPayload());
		System.out.println(session.getId());
		int index = message.getPayload().indexOf(",");
		int index2 = message.getPayload().indexOf(",", index + 1);
		String num = message.getPayload().substring(0, index);
		String chat_no = message.getPayload().substring(index + 1, index2);
		String msg = message.getPayload().substring(index2 + 1);

		if (num.equals("0")) {
			if (sessionMap.containsKey(chat_no)) {
				sessionMap.get(chat_no).add(session);
			} else {
				List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
				sessionList.add(session);
				sessionMap.put(chat_no, sessionList);
			}
		} else {
			// ��� �������� �޼��� ���
			for (WebSocketSession sess : sessionMap.get(chat_no)) {
				sess.sendMessage(new TextMessage(msg));
			}
		}
		/*
		 * for (WebSocketSession sess : sessionList) { sess.sendMessage(new
		 * TextMessage(msg)); }
		 */
	}

	// Ŭ���̾�Ʈ ������ ������ �� ����
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
		logger.info("{} ���� ����.", session.getId());
	}
}
