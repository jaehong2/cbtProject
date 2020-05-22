/*
 * package com.cbt.common;
 * 
 * import java.io.IOException; import java.util.ArrayList; import
 * java.util.List;
 * 
 * import javax.websocket.OnClose; import javax.websocket.OnError; import
 * javax.websocket.OnMessage; import javax.websocket.OnOpen; import
 * javax.websocket.RemoteEndpoint.Basic; import javax.websocket.Session; import
 * javax.websocket.server.ServerEndpoint;
 * 
 * import org.json.simple.JSONObject; import org.json.simple.parser.JSONParser;
 * import org.json.simple.parser.ParseException; import org.slf4j.Logger; import
 * org.slf4j.LoggerFactory; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * import com.cbt.Inquiry.InquiryService; import com.cbt.Inquiry.InquiryVO;
 * 
 * // 2019.07.18 성재민 // @ServerEndpoint(value = "/echo.do") 는 // /echo.do 라는 url
 * 요청을 통해 웹소켓에 들어가겠다 라는 어노테이션.
 * 
 * @ServerEndpoint(value="/echo.do")
 * 
 * @Controller public class WebSocketChat { private static final List<Session>
 * SESSION_LIST = new ArrayList<Session>(); private static final List<Object[]>
 * SESSION_INFO_LIST = new ArrayList<Object[]>(); private static final Logger
 * LOGGER = LoggerFactory.getLogger(WebSocketChat.class);
 * 
 * @Autowired InquiryService inquiryService;
 * 
 * public WebSocketChat() { System.out.println("웹소켓(서버) 객체 생성"); }
 * 
 * @RequestMapping(value = "/chat.do", method = RequestMethod.GET) public String
 * chatViewPage() { return "empty/common/commonChattingProcess"; }
 * 
 * // 2019.07.20 성재민 // 방번호 전달 받아서 해당 방에서 대화 할수 있는 채팅 연결
 * 
 * @RequestMapping(value = "/chatRoomId.do/{roomId}", method =
 * RequestMethod.GET) public String chatView(@PathVariable("roomId") String
 * roomId, Model model) { model.addAttribute("roomId", roomId); return
 * "empty/common/commonChattingProcess"; }
 * 
 * // 2019.07.18 성재민 // @OnOpen 는 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어 왔을때 실행하는 메소드
 * 
 * @OnOpen public void onOpen(Session session) {
 * LOGGER.info("Open session id : " + session.getId());
 * 
 * 
 * final Basic basic = session.getBasicRemote(); try {
 * //basic.sendText("Connection Established"); } catch (IOException e) {
 * e.printStackTrace(); }
 * 
 * 
 * SESSION_LIST.add(session); }
 * 
 * // 2019.07.18 성재민 // 모든 사용자에게 메시지를 전달한다. // 어떤 누군가에게 메시지가 왔다면 그 메시지를 보낸
 * 자신을제외한 // 연결된 세션(클라이언트)에게 메시지를 보내는 메소드 private void
 * sendAllSessionToMessage(Session self, String message) { try { for(Session
 * session : WebSocketChat.SESSION_LIST) {
 * if((self.getId().compareTo(session.getId()) != 0)) {
 * session.getBasicRemote().sendText(message); } else { // 2019.07.26 성재민 //
 * (self.getId().compareTo(session.getId()) == 0) 일때 // 즉 현재 메시지를 보낸 대상이 자기 자신일때
 * 처리 // 세션 정보와 유저 id 채팅방 id 를 리스트에 저장 boolean isOverlap = false; for(Object[]
 * obj : WebSocketChat.SESSION_INFO_LIST) { if(((Session) obj[0]) == session) {
 * isOverlap = true; break; } }
 * 
 * if(isOverlap == false) { JSONParser jsonParser = new JSONParser(); JSONObject
 * jsonObj = (JSONObject) jsonParser.parse(message); String id = (String)
 * jsonObj.get("id"); String rid = (String) jsonObj.get("rid");
 * 
 * Object[] tempObj = { session, id, rid }; SESSION_INFO_LIST.add(tempObj); } }
 * } } catch (IOException e) { e.printStackTrace(); } catch (ParseException e) {
 * // TODO Auto-generatedcatch block e.printStackTrace(); } }
 * 
 * // 2019.07.18 성재민 // 클라이언트에서 메시지가 들어왔을 때, 실행되는 메소드
 * 
 * @OnMessage public void onMessage(String message, Session session) {
 * LOGGER.info("Message From " + message); try { final Basic basic =
 * session.getBasicRemote(); basic.sendText(message); } catch (IOException e) {
 * e.printStackTrace(); }
 * 
 * sendAllSessionToMessage(session, message); }
 * 
 * @OnError public void onError(Throwable e, Session session) {
 * 
 * }
 * 
 * // 2019.07.18 성재민 // 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드
 * 
 * @OnClose public void onClose(Session session) { LOGGER.info("Session " +
 * session.getId() + " has ended"); SESSION_LIST.remove(session);
 * 
 * // 2019.07.26 성재민 // 채팅 창이 닫히면 현재 세션값으로 저장된 정보 제거 Object[] deleteObj = null;
 * if (SESSION_INFO_LIST.size() > 0) { for (Object[] obj : SESSION_INFO_LIST) {
 * if (((Session) obj[0]) == session) { deleteObj = obj; } }
 * 
 * if (deleteObj != null) { InquiryVO vo = new InquiryVO();
 * vo.setInquiryRoomId((String) deleteObj[2]); vo.setReplyStatus("처리완료");
 * 
 * inquiryService.updateInquiry(vo);
 * 
 * SESSION_INFO_LIST.remove(deleteObj);
 * System.out.println(SESSION_INFO_LIST.size()); } }
 * 
 * } }
 */