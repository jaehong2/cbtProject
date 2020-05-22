<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<style>

	table {
		width: 100%;
		border-top: 1px solid #444444;
		border-collapse: collapse;
	}
	
	th {
		border-bottom: 1px solid #444444;
		padding: 10px;
	}
	
	td {
		padding: 10px;
	}
	
	#floatMenu {
		position: absolute;
		width: 100px;
		height: 200px;
		right: 20px;
		top: 200px;
		background-color: white;
	}
	
	p:hover,
	p:focus {
		color: #CA2006;
		font-size : 20px;
		box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
		transform: translateY(-0.25em);
	}
	
	div.rightAnswer:hover,
	div.rightAnswer:focus {
		color: #CA2006;
		font-size : 20px;
		box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
		transform: translateY(-0.25em);
	}
	
	.wrap {
		height: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	#button {
		width: 90px;
		height: 35px;
		font-family: 'Roboto', sans-serif;
		font-size: 14px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: #fff;
		background-color: #5F5E5E;
		border: none;
		border-radius: 45px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}
	
	#button:hover {
		background-color: lightblue;
		box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		color: #fff;
		transform: translateY(-7px);
	}
	
	.button {
		width: 140px;
		height: 45px;
		font-family: 'Roboto', sans-serif;
		font-size: 14px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: #fff;
		background-color: #5F5E5E;
		border: none;
		border-radius: 45px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}
	
	.button:hover {
		background-color: lightblue;
		box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		color: #fff;
		transform: translateY(-7px);
	}
	
	@keyframes dash {
		to {
			stroke-dashoffset: 0;
		}
	}
	
	.svg {
		position: absolute;
		stroke-dasharray: 500;
		stroke-dashoffset: 500;
		animation: dash 0.3s 0.1s linear forwards;
	}
	
	.svg1 {
		position: absolute;
		stroke-dasharray: 500;
		stroke-dashoffset: 500;
		animation: dash 0.3s 0.4s linear forwards;
	}
	
	.svg2 {
		position: absolute;
		stroke-dasharray: 500;
		stroke-dashoffset: 500;
		animation: dash 0.3s 0.1s linear forwards;
	}
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script type="text/javascript">

	$(document).ready(function(){
		
		var defaultBGColor	=	'';
		
		var inputBGColor	=	'rgba(0, 0, 0, 0)';
		var outputBGColor	=	'';
		
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		
		var falseLine = parseInt($("#falseLine").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		
		$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			
			$("#floatMenu").stop().animate({"top" : newPosition}, 500);
		
		}).scroll();
		
		// 바로가기 탭 마우스오버 이벤트
		$(function (){
			// 마우스 올렸을때 색상변환
			$(".floatMenu").mouseenter(function(){
				// 위치 값 가져오기
				var count = $(this).children().attr("value");
				// 해당위치 색상 변수 저장
				inputBGColor	=	$("#floatMenu"+count+"").css('background-color');
				// input변수에 저장된 값 비교후 output변수에 담기    -- 색상바뀐값 적용위해
				if(inputBGColor == 'rgba(0, 0, 0, 0)'){
					outputBGColor	=	'rgba(0, 0, 0, 0)';
					$("#floatMenu"+count+"").css('background-color','#A0ACFC');
					
				} else if(inputBGColor == 'rgb(248, 165, 166)'){
					
					outputBGColor	=	'rgb(248, 165, 166)';
					$("#floatMenu"+count+"").css('background-color','#A0ACFC');
					
				} else if(inputBGColor == '#A0ACFC'){
					
					outputBGColor	=	'#A0ACFC';
					$("#floatMenu"+count+"").css('background-color','#A0ACFC');
					
				}
			})
			// 마우스 뗏을때 색상변환
			$(".floatMenu").mouseleave(function(){
				var count = $(this).children().attr("value");
				
				if(inputBGColor == 'rgba(0, 0, 0, 0)'){
					
					$("#floatMenu"+count+"").css('background-color','rgba(0, 0, 0, 0)');
					
				} else if(inputBGColor == 'rgb(248, 165, 166)'){
					
					$("#floatMenu"+count+"").css('background-color',outputBGColor);
					
				} else if(inputBGColor == '#A0ACFC'){
					
					$("#floatMenu"+count+"").css('background-color',outputBGColor);
					
				}
			})
			
		})
		
		$(".rightAnswer").click(function(){
			var count = $(this).attr("value");
			var top = $(this).offset().top;
			var left = $(this).offset().left;
			
			
			$("#rightAnswerView"+count).hide();
			$("#rightAnswerHide"+count).show();
			
			
			$("#CommentaryView"+count).hide();
			$("#CommentaryHide"+count).show();
			
			var rightAnswer = $("#rightAnswerHide"+count).attr('value');
			var takerAnswer = $("#takerAnswer"+count).attr('value');
			
			if(rightAnswer != takerAnswer){
				$("#floatMenu"+count).css('background-color','#F8A5A6');
				$("#point"+count).attr('hidden', false).html("오답 입니다.");
				$('#questuin'+count).append('<div align="left"><svg class="svg"><path class="path" fill="transparent" stroke="red" d="M 150,0 50,100">')
									.append('<div align="left"><svg class="svg1"><path class="path" fill="transparent" stroke="red" d="M 50,0 150,100">');
				for(var i=1; i<=4; i++){
					
					var exam = $("#exam"+count+i).attr('value');
					if(exam == takerAnswer){
						$("#exam"+count+i).css('background-color','#F8A5A6');
						break;
					}
					
				}
			} else if(rightAnswer == takerAnswer){
				$("#point"+count).attr('hidden', false);
				$("#floatMenu"+count).css('background-color','#A0ACFC');
				$('#questuin'+count).append('<div align="left"><svg class="svg2"><path class="path" fill="transparent" stroke="blue" d="M 30 0 C 90 110 0 140 150 0 ">');
				
			}
			
			for(var i=1; i<=4; i++){
				
				var exam = $("#exam"+count+i).attr('value');
				
				if(exam == rightAnswer){
					$("#exam"+count+i).css('background-color','#A0ACFC');
					break;
				}
				
			}
				
		})
		
		
		$(".scroll tr th").click(function(){
			
			var count = $(this).attr("value");
			
			if(count == 1){
				scrollPosition = $("body").offset().top;
				$("html, body").animate({scrollTop: scrollPosition}, 500);
				return;
			}
			
			count = count-1;
			
			var scrollPosition = $("[id ='questuin"+count+"']").offset().top;
			
			$("html, body").animate({scrollTop: scrollPosition}, 500);
			
		})
		
	})
	
	function allView(){
		
		var v = $("[id^='floatMenu']").length;
		var max = v-1;
		
		for(var count=1; count<=max; count++){
			$("#rightAnswerView"+count).hide();
			$("#rightAnswerHide"+count).show();
			
			
			$("#CommentaryView"+count).hide();
			$("#CommentaryHide"+count).show();
			
			var rightAnswer = $("#rightAnswerHide"+count).attr('value');
			var takerAnswer = $("#takerAnswer"+count).attr('value');
			
			if(rightAnswer != takerAnswer){
				$("#floatMenu"+count).css('background-color','#F8A5A6');
				$("#point"+count).attr('hidden', false).html("오답 입니다.");
				$('#questuin'+count).append('<div align="left"><svg class="svg"><path class="path" fill="transparent" stroke="red" d="M 150,0 50,100">')
									.append('<div align="left"><svg class="svg1"><path class="path" fill="transparent" stroke="red" d="M 50,0 150,100">');
				for(var i=1; i<=4; i++){
					
					var exam = $("#exam"+count+i).attr('value');
					if(exam == takerAnswer){
						
						$("#exam"+count+i).css('background-color','#F8A5A6');
						break;
					}
					
				}
				
			} else if(rightAnswer == takerAnswer){
				$("#point"+count).attr('hidden', false);
				$("#floatMenu"+count).css('background-color','#A0ACFC');
				$('#questuin'+count).append('<div align="left"><svg class="svg2"><path class="path" fill="transparent" stroke="blue" d="M 30 0 C 90 110 0 140 150 0 ">');
			}
			
			for(var i=1; i<=4; i++){
				
				var exam = $("#exam"+count+i).attr('value');
				
				if(exam == rightAnswer){
					$("#exam"+count+i).css('background-color','#A0ACFC');
					break;
				}
				
			}
		}
	}
	
</script>
</head>
<body>

<!-- <div id="falseLine">
	<svg id="svg">
		<path stroke-width='6' fill='transparent' stroke="red" d="M 120,0 C 80,10 40,50 10,90 " />
	</svg>
</div> -->

	<div id="floatMenu">
		<p style="font-size: 10px"onclick="allView()" ><button id="button">모두 보기</button></p>
		<table class="scroll">
			<tr>
				<th style="padding: 0px;">바로가기</th>
			</tr>
			<c:forEach items="${rightAnswer}" var="list" varStatus="status">
				<tr class="floatMenu">
					<th id="floatMenu${status.count}" value="${status.count}" style="font-size: 10px; padding: 1px;">${status.count} . </th>
				</tr>
			</c:forEach>
		</table>
	</div>
<h2 align="center">풀이 및 해설</h2>
<br><br>
	
	<table class="mainTab">
	
		<c:forEach items="${rightAnswer}" var="list" varStatus="status">
		
		<tr>
			<th><input id="takerAnswer${status.count}" value="${list.takerAnswer}" hidden="true"></th>
			<th align="left" valign="top" ></th>
			<th></th>
		</tr>
		<!---------------------내용시작------------------>
		
		
		<!--테이블 시작 -->
		<thead class="table-success">
		<tr>
			<th id="questuin${status.count}"><h3 align="left" style="padding-left: 15%">${status.count} . ${list.questionContent}</h3></th>
			<th></th>
			<th style="width: 20%;"><p id="point${status.count}" hidden="true">+ ${list.point} point</p></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td align="left" class="exam${status.count}" id="exam${status.count}1" value="${list.example1}" style="padding-left: 20%">1. ${list.example1} </td>
			<td></td>
			<td rowspan="2">
				<div class="rightAnswer" id="rightAnswerView${status.count}" value="${status.count}" ><button class='btn btn-success'>정답 보기</button></div>
				<div class="rightAnswer" id="rightAnswerHide${status.count}" value="${list.rightAnswer}" style="display: none;">정답 : ${list.rightAnswer}</div>
			</td>
		</tr>
		
		<tr>
			<td align="left" class="exam${status.count}" id="exam${status.count}2" value="${list.example2}" style="padding-left: 20%">2. ${list.example2}</td>
			<td></td>
			<td></td>
		</tr>
		
		<tr>
			<td align="left" class="exam${status.count}" id="exam${status.count}3" value="${list.example3}" style="padding-left: 20%">3. ${list.example3}</td>
			<td></td>
			<td rowspan="2">
				<div id="CommentaryView${status.count}" ></div>
				<div id="CommentaryHide${status.count}" style="display: none;">해설 : ${list.rightCommentary}</div>
			</td>
		</tr>
		
		<tr>
			<td align="left" class="exam${status.count}" id="exam${status.count}4" value="${list.example4}" style="padding-left: 20%">4. ${list.example4}</td>
			<td></td>
			<td></td>
		</tr>
		
		<tr>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		
		</c:forEach>
		
		<tr>
			<th></th>
			<th colspan="2"><!-- <a href="#" class="previous">&laquo; Previous</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="next">Next &raquo;</a> --></th>
			<th></th>
		</tr>
		<tr>
			<td></td>
			<td colspan="2">
				<%-- <a href="${pageContext.request.contextPath }/candidateMain.do"><button>수정 요청</button></a> --%>
				<a href="${pageContext.request.contextPath }/candidateMain.do"><button class="btn btn-primary">메인으로</button></a>
			</td>
			<td></td>
		</tr>
		
	</tbody>
	</table>
			



</body>
</html>