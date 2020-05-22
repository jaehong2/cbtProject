package com.cbt.common;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.cbt.Inquiry.InquiryService;
import com.cbt.Inquiry.InquiryVO;

// 2019.07.26 성재민
// 기존 일반 웹소켓을 스프링 웹소켓으로 변경하기 위해 생성
@Controller
public class EchoHandler extends TextWebSocketHandler implements InitializingBean {
	// 2018.07.29 성재민
	// 문의 상태 변환을 위해 추가
	@Autowired
	InquiryService inquiryService;

	// 2019.07.26 성재민
	// 웹 소켓 세션을 저장할 리스트 생성
	private static final List<WebSocketSession> SESSION_LIST = new ArrayList<WebSocketSession>();
	private static final List<Object[]> SESSION_INFO_LIST = new ArrayList<Object[]>();
	private static final Logger LOGGER = LoggerFactory.getLogger(EchoHandler.class);

	public EchoHandler() {
		super();
		EchoHandler.LOGGER.info("create SocketHandler instance!");
	}

	// 2019.07.26 성재민
	// 클라이언트 연결 된 후
	// WebSocketSession을 매개 변수로 받고 클라이언트가 연결된 후
	// 해당 클라이언트의 정보를 가져와 연결확인 작업을한다.
	// 클라이언트의 세션을 세션 저장 리스트에 add()로 추가 한다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		SESSION_LIST.add(session);
		EchoHandler.LOGGER.info("add session!");
	}

	// 2019.07.26 성재민
	// 클라이언트와 연결이 끊어진 경우
	// add()와 반대로 remove()를 이용해서 세션리스트에서 제거한다.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 2019.07.29 성재민
		// 문의자의 세션이 종료가 되면
		// 해당 문의의 상태를 처리완료로 변경
		Object[] deleteObj = null;

		// 2019.07.29 성재민
		// SESSION_INFO_LIST 에서 현재 연견이 끊어진 세션을 찾음.
		for (Object[] obj : EchoHandler.SESSION_INFO_LIST) {
			if ((WebSocketSession) obj[0] == session) {
				deleteObj = obj;
				break;
			}
		}

		// 2019.07.29 성재민 
		// 해당 세션이 ROLE_USER 인경우 
		// 처리 완료로 상태 변경 
		if (deleteObj != null) { 
			if (((String)deleteObj[3]).compareTo("ROLE_USER") == 0) { 
				InquiryVO vo = new InquiryVO(); 
				vo.setInquiryRoomId((String) deleteObj[2]);
				vo.setReplyStatus("처리완료"); 
				inquiryService.updateInquiry(vo); 

				String msg = "{\"type\":\"system_room_out\","
							+ "\"msg\":\"" + deleteObj[1] + "님이 퇴장 하셨습니다.\","
							+ "\"role\":\"" + deleteObj[3] 
							+ "\",\"id\":\"" + deleteObj[1] 
							+ "\",\"rid\":\"" + deleteObj[2] + "\"}";
				sendMessage(msg);
			} 
			SESSION_INFO_LIST.remove(deleteObj); 
		}
		
		super.afterConnectionClosed(session, status);
		SESSION_LIST.remove(session);
		EchoHandler.LOGGER.info("remove session!");
	}

	// 2019.07.26 성재민
	// 클라이언트로부터 메시지가 도착했을때 호출
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);

		for (WebSocketSession webSession : EchoHandler.SESSION_LIST) {
			if (webSession.isOpen()) {
				try {
					webSession.sendMessage(message);
				} catch (Exception ignored) {
					EchoHandler.LOGGER.error("fail to send message!", ignored);
				}

				if (session.getId().compareTo(webSession.getId()) == 0) {
					boolean isOverlap = false;

					for (Object[] obj : EchoHandler.SESSION_INFO_LIST) {
						if (((WebSocketSession) obj[0]) == session) {
							isOverlap = true;
							break;
						}
					}

					if (isOverlap == false) {
						String jsonMsg = (String) message.getPayload();
						JSONParser jsonParser = new JSONParser();
						JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonMsg);
						String id = (String) jsonObj.get("id");
						String rid = (String) jsonObj.get("rid");
						String role = (String) jsonObj.get("role");
						Object[] newObj = { session, id, rid, role };
						SESSION_INFO_LIST.add(newObj);
					}
				}
			}
		}

		EchoHandler.LOGGER.info("receive message:" + message.toString());
	}

	// 2019.07.26 성재민
	// 전송 에러가 발생할때 호출
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		EchoHandler.LOGGER.error("web socket error!", exception);
	}

	// 2019.07.26 성재민
	// WebSocketHandler가 부분 메시지를 처리할 때 호출
	@Override
	public boolean supportsPartialMessages() {
		EchoHandler.LOGGER.info("call method!");
		return super.supportsPartialMessages();
	}

	public void sendMessage(String message) {
		for (WebSocketSession session : EchoHandler.SESSION_LIST) {
			if (session.isOpen()) {
				try {
					session.sendMessage(new TextMessage(message));
				} catch (Exception ignored) {
					EchoHandler.LOGGER.error("fail to send message!", ignored);
				}
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		/*
		 * Thread thread = new Thread() { int i = 0;
		 * 
		 * @Override public void run() { while (true) { try {
		 * sendMessage("send message index " + i++); Thread.sleep(1000); } catch
		 * (InterruptedException e) { e.printStackTrace(); break; } } } };
		 * 
		 * thread.start();
		 */
	}

	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chatViewPage() {
		return "empty/common/commonChattingProcess";
	}

	// 2019.07.20 성재민
	// 방번호 전달 받아서 해당 방에서 대화 할수 있는 채팅 연결
	@RequestMapping(value = "/chatRoomId.do/{roomId}", method = RequestMethod.GET)
	public String chatView(@PathVariable("roomId") String roomId, Model model) {
		model.addAttribute("roomId", roomId);
		return "empty/common/commonChattingProcess";
	}
}
