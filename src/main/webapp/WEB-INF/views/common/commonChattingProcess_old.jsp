<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>채팅하기</title>
<script type="text/javascript">
	$(document).ready(function() {
		var ws;
		if (ws != undefined && ws.readyState != WebSocket.CLOSED) {
			$("#messages").append("<br>" + "WebSocket is already opened.");
			return;
		}
		
		// 웹소켓 객채 생성
		ws = new WebSocket("ws://192.168.0.112:8081/project/echo.do");
		ws.onopen = function(event) {
			if(event.data===undefined) 
				return;

			onOpen(event);
		};
		
		ws.onmessage = function(event) {
			onMessage(event);
		};

		$("#sendBtn").click(function() {
			var sendMessage = {
		    		type: "message",
		    		msg: $("#messageInput").val(),
		    		id: "test",
		    		rid: "roomTest"
		    	};

			ws.send(JSON.stringify(sendMessage));
			$("#messageInput").val("");
		});

		// 2019.07.18 성재민
		// 메시지를 화면에 전시
		function onMessage(event) {
			var message = JSON.parse(event.data);
			
			var myTable = $("<table>");
    		myTable.attr("width", "300px");
    		var myTr = $("<tr>");
    		myTr.attr("width", "300px");
    		var tempTd = $("<td>");
    		tempTd.attr("width", "20%");
    		var myTd = $("<td>");
    		myTd.text(message.id + " : " + message.msg);
    		
    		myTr.append(myTd);
    		myTr.append(tempTd);
    		myTable.append(myTr);
    		
    		$("#messages").append(myTable);	
    		$("#messages").scrollTop($("#div").prop("scrollHeight"));
		}
		
		function onOpen(event) {
	        console.log("오픈");
	        var myTable = $("<table>");
	    	myTable.attr("width", "300px");
	    	var myTr = $("<tr>");
	    	myTr.attr("width", "300px");
    		var myTd = $("<td>");
    		myTd.attr("colspan", "2");
    		myTd.attr("align", "center");
    		myTd.text("연결 성공");
    		myTr.append(myTd);
    		myTable.append(myTr);
    		$("#messages").append(myTable);
    		$("#messages").scrollTop($("#div").prop("scrollHeight"));
	    }
	});
</script>
</head>
<body>
	<div>
		<!-- 2019.07.18 성재민 -->
		<!-- value 값은 로그인된 유저라면 해당 유저의 id 가 -->
		<!-- 비 로그인 된 유저라면 손님이니 비로그인 유저라는 표시 -->
		<input type="text" id="sender" value="test" style="display: none;">
		<input type="text" id="messageInput">
	</div>

	<div>
		<button type="button" id="sendBtn">Send</button>
	</div>

	<!-- 2019.07.18 성재민 -->
	<!-- 서버에서 전송받은 값이 전시 되는 부분 -->
	<div id="messages"></div>
</body>
</html>