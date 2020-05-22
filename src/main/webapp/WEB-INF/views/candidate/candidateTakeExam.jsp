<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html onmouseout="blockOver()" onselectstart="return blockSelect()" oncontextmenu="return blockRightClick()">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<style>

	.floatMenu:hover { 
		background-color: lightblue;
	}
	
	.wrap {
		height: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
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

	#mainTable {
		
		width	:	80%;
		height	:	80%;
		margin-top: 10%;
		margin-left: 5%;
		border-color: #fff;
		border: none;
		border-radius: 25px;
		
	}

	#floatMenu {
		position: absolute;
		width: 100px;
		height: 200px;
		right: 20px;
		top: 200px;
		background-color: white;
	}
	
	#floatMenu table {
		width: 100%;
		border-collapse: collapse;
		border: none;
		border-radius: 25px;
		
	}
	
	.tab {
		width: 100%;
		border-color: #fff;
		border: none;
		border-radius: 25px;
		font-size: 20px;
	}
	
	#exam1:hover {
		color: red;
		font: bolder;
		font-size: 22px;
		transition : width, 1s, ease, 0.4s;
		transform: translateY(-7px);
		text-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		
	}
	
	#exam2:hover {
		color: red;
		font: lighter;
		font-size: 22px;
		transition : width, 1s, ease, 0.4s;
		transform: translateY(-7px);
		text-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	}
	
	#exam3:hover {
		color: red;
		font: 500;
		font-size: 22px;
		transition : width, 1s, ease, 0.4s;
		transform: translateY(-7px);
		text-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	}
	
	#exam4:hover {
		color: red;
		font: large;
		font-size: 22px;
		transition : width, 1s, ease, 0.4s;
		transform: translateY(-7px);
		text-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	}
	
	#answer1 tr:hover {
		padding-top: 6px;
		padding-bottom : 6px;
		color: red;
		background-color: lightblue;
		font: large;
		transition : width, 1s, ease, 0.4s;
		transform: translateX(-10px);
		border-radius: 25px;
	}
	
	#answer1 tr {
		margin: 6px;
		font: large;
		transition : width, 1s, ease, 0.4s;
		border-collapse: collapse;
		border: none;
		border-radius: 25px;
	}
	
	#answer1 td {
		margin: 6px;
		font: large;
		transition : width, 1s, ease, 0.4s;
		border-collapse: collapse;
		border: none;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	// 우클릭 방지
	function blockRightClick(){
	    return window.close();
	}
	
	// 
	function blockOver(){
		if(swap != 0){
			return window.close();
		}
		return false;
	}

	var i = 0;
	var data;
	var a = 1;
	var count = 0;
	var swap = 0;
	
	function resize(){
		$( window ).resize(function() {
			swap = 1;
		})
	}
	
	$(document).ready(function() {
		
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		
		$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			
			$("#floatMenu").stop().animate({"top" : newPosition}, 500);
		
		}).scroll();
		
		$('#mainTab').hide();
		
		$("#examId").html("시험 응시")
		$("#question").html("문제")
		
		$('#btn').click(function () {  
			if($("#btn").css("display") == "none"){   
				$('#btn').show(); 
				$('#warBtn').show(); 
			} else {  
				$('#btn').hide();
				$('#mainTab').show();
				$('#warBtn').hide();
			}  
		});
		
		var takerId			=	"${takerId}";
		var examId			=	"${examVO.examId}";
		var takeExamId		=	"${takeExamId}";
		var examName		=	"${examVO.examName}";
		var passingScore	=	"${examVO.passingScore}";
		var examStartTime	=	"${examVO.examStartTime}";
		var examEndTime		=	"${examVO.examEndTime}";
		
		console.log(takerId);
		console.log(examId);
		console.log(takeExamId);
		console.log(examName);
		console.log(passingScore);
		console.log(examStartTime);
		console.log(examEndTime);
		
		
		$("#floatMenu").hide();
		
		/* 문제풀기 시작 버튼 */
		$('#btn').on("click", function() {
			console.log("문제 풀기");
			
			document.documentElement.webkitRequestFullscreen();
			
			setTimeout("resize()", 2000);

			$("#floatMenu").show();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getTestStart.do",
				method : "post",
				data : {takerId : takerId, examId : examId, takeExamId : takeExamId, examName : examName, 
					passingScore : passingScore, examStartTime : examStartTime },
				type : "json",
				success : function(datas) {
					
					data = datas;
					count = datas.length;
					
					

					/*                         문제 난수 만들기        Start          */
					var numbers = [];
			        var pickNumbers = data.length;
			         
			        for(insertCur = 0; insertCur < pickNumbers; insertCur++){
			            numbers[insertCur] = Math.floor(Math.random() * data.length);

			            for(searchCur = 0; searchCur < insertCur; searchCur++){
			                if(numbers[insertCur] == numbers[searchCur]){
			                    insertCur--; 
			                    break; 
			                }
			            }
			        }
			        console.log(data);
			        
			        
			        /*                         보기 난수 만들기           Start          	   */
			        var num = [];
			        var examNum = 4;
			        
			        for(insertCur = 0; insertCur < examNum ; insertCur++){
			        	num[insertCur] = Math.floor(Math.random() * examNum);

			            for(searchCur = 0; searchCur < insertCur; searchCur ++){
			                if(num[insertCur] == num[searchCur]){
			                    insertCur--; 
			                    break; 
			                }
			            }
			        }
			        
			        
			        /*  보기 난수값 활용해 보기 출력하는 펑션	*/
			        function mixExam(){
			        	var ex = new Array;
				        
			        	ex[num[0]] = data[numbers[i]].example1;
			        	ex[num[1]] = data[numbers[i]].example2;
			        	ex[num[2]] = data[numbers[i]].example3;
			        	ex[num[3]] = data[numbers[i]].example4;
			        	
			        	for(var v=0;v<=3;v++){
			        		var j=v+1;
			        		/* 보기 출력    */
			        		$("#exam"+j).html(j+" . " + ex[v]);
			        		/* 보기 라디오 버튼  */
			        		$("#td"+j).html('').append($("<input>").attr("type","radio").attr("id","example"+num[v]).attr("name","rExam").attr("value",ex[v]));
			        		
			        	}
			        	
			        	if(data[numbers[i]].takerAnswer != null){
							$("[name ='rExam']").val([data[numbers[i]].takerAnswer]);
						}
			        	
			        	$("#examId").html(examName);
			        	$("#question").html(a+" .   "+data[numbers[i]].questionContent);
						$("#point").html(" +  " + data[numbers[i]].point + " Point");
			        	
			        }
			        
			        
			        /* 문제 수 만큼의 OMR 라디오 버튼 만들기 */
					for(var c=1; c <= count; c++) {
		        		var ex = new Array;
				        
			        	ex[num[0]] = data[numbers[c-1]].example1;
			        	ex[num[1]] = data[numbers[c-1]].example2;
			        	ex[num[2]] = data[numbers[c-1]].example3;
			        	ex[num[3]] = data[numbers[c-1]].example4;
			        	
						$("#answer1").append($("<tr>").attr('class','floatMenu').attr("value",c).attr("name","goExam"+c+"")
							.append($("<td>").attr("id","answer"+c).html(c+" . "))
							.append($("<td>").attr('class','floatMenu').append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[0])))
							.append($("<td>").attr('class','floatMenu').append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[1])))
							.append($("<td>").attr('class','floatMenu').append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[2])))
							.append($("<td>").attr('class','floatMenu').append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[3]))))
						
						if(data[numbers[c-1]].takerAnswer != null){
							$("[name ='exam"+c+"']").val([data[numbers[c-1]].takerAnswer]);
							$("[name ='exam"+c+"']").parent().parent().css('background-color','lightblue');
						} 
						
					}
			        
			        $("tr[name^='goExam']").on("click", function() {
			        	console.log($(this).attr('value'));
			        	i = parseInt($(this).attr('value')-1);
			        	a = parseInt($(this).attr('value'));
			        	
			        	mixExam();
			        	
			        })
			        
			        
			        
			        /* 섞은 보기 출력 */
			        mixExam();
			        
					
					/* 실시간 문제 업데이트 */
					function updateAnswer(){
						
						$("tr[class^='tr']").on("click", function() {
							
							var tr = $(this);
							
							var choice = $(this).find('input').attr('id');
				        	var takerAnswer = $(this).find('input').val();
				        	var setExamQuestionId = data[numbers[i]].setExamQuestionId;
				    		console.log(choice);
				    		console.log(takerAnswer);
				    		
				    		$.ajax({
								url : "${pageContext.request.contextPath}/updateTakeExamHistory.do",
								method : "post",
								data : {takerAnswer : takerAnswer, setExamQuestionId : setExamQuestionId,
									takeExamId:takeExamId} , 
								datatype : "json",
								success : function(data){
									
					    			$("[name ='exam"+a+"']").val([takerAnswer]);
					    			$("[name ='exam"+a+"']").parent().parent().css('background-color','lightblue');
					    			for(var i=1; i<=4; i++){
										$('.tr'+i).css('background-color','white');
									}
									tr.css('background-color','lightblue');
								}
				    		})
						})
					}
					updateAnswer();
					
					
					/* 다음문제 or Next 버튼 클릭시 섞은 다음 문제, 예제 보기 */
					$('#nBtn').on("click", function() {
						
						if(a != count){
							
							i = i+1;	
							a = a+1;
							
							mixExam();
							
						
						} else {
							
							console.log('없어');
						}
						updateAnswer();
					})
					
					
					/* 이전문제 or Previous 버튼 클릭시 섞은 이전 문제, 예제 보기 */
					$('#pBtn').on("click", function() {
						
						if(a != 1){
							
							i = i-1;	
							a = a-1;
							
							mixExam();
							
						
						} else {
							
							console.log('없어');
						}
						updateAnswer();
					})
					
					$('#endBtn').on("click", function() {
						
						var check	=	0;
						
						for(var c=1; c <= count; c++){
							if($("input:radio[name='exam"+c+"']").is(":checked") == false){
								$("input:radio[name='exam"+c+"']").parent().parent().attr('style','background-color : red; transition : width, 1s, ease, 1s;');

								check = 1;
							}
						}
						
						if(check == 0){
							takeExamForm.submit();
							
						}
						
					})
					
					window.onkeydown = function(event) {
						var kcode = event.keyCode;
						if(kcode == 27) {
							event.returnValue = false;
							window.close();
						} else {
							window.close();
						}
					}
					
					
					function getTimeStamp(serverDate) {
						var d = new Date(serverDate);
						var s =
							leadingZeros(d.getHours(), 2) + ':' +
							leadingZeros(d.getMinutes(), 2) + ':' +
							leadingZeros(d.getSeconds(), 2);
					
						console.log(s);
						
						$("#countdown").html(s);
						
						
					}
					
					function leadingZeros(n, digits) {
						var zero = '';
						n = n.toString();
						
						if (n.length < digits) {
							for (i = 0; i < digits - n.length; i++)
							zero += '0';
						}
						return zero + n;
					}
					
					
				 	$(function() {
				 		
				 		var eTime = new Date(examEndTime);
						var sTime = new Date(examStartTime);
						
						var h = eTime.getHours() - sTime.getHours();
						var mi = eTime.getMinutes() - sTime.getMinutes();
						
				 		var examTime = 0;
						var hour = 0;
						var min = 0;
						var sec = 0;
						
						console.log(h);
						console.log(mi);
						
						examTime = (h*3600)+(mi*60);
				 		
						timer = setInterval( function () {
						
							console.log(examTime);
							
							
							hour = parseInt(examTime/3600);
							min = parseInt((examTime%3600)/60);
							sec = examTime%60;
							
							$('#countdown').html(hour+" : "+min+" : "+sec);
							
							if(parseInt(examTime) == 0) {
								alert('시간초과');
								takeExamForm.submit();
							} else {
								examTime --;
								if(parseInt(examTime) <= 60) {
									$('#countdown').css('background-color','red');
								}
							}
						
						}, 1000);
					
					});
				}
			})
		})
	});
	
</script>
</head>
<body>
	<form id="takeExamForm" name="takeExamForm" action="${pageContext.request.contextPath }/candidateTestRedirect.do" method="post">
		<input type="text" id="eId" name="examId" value="${examVO.examId }" hidden="ture">
		<input type="text" id="tId" name="takeExamId" value="${takeExamId }" hidden="ture">
	</form>
	
	<div id="floatMenu">
		<div id="countdown"></div>
		<table id="answer1">
			<tr style="">
				<th id="first">No.</th>
				<th>1.</th>
				<th>2.</th>
				<th>3.</th>
				<th>4.</th>
			</tr>
			<tr>
				<td colspan="5" align="center" valign="top">
				</td>
			</tr>
		</table>
	</div>
	<div id="mainTabDiv">
		<p class="wrap" >
			<button class="button" id="btn">시험 시작 !</button>
		</p>
		
		<div id="mainTab">
		<table border="1" id="mainTable">
			<tr >
				<td><h2 align="center" id="examId" value=""></h2></td>
			</tr>
			<tr height="200">
				<td><div><h2 align="center" id="question"></h2><p align="right" id="timer"></p></div></td>
			</tr>
			<tr>
				<td align="left" valign="top" width="900" height="100">
					<table class="tab">
						<tr>
							<th width="80px;"></th>
							<th ></th>
							<th ></th>
							<th id="point" align="right" style="padding-left: 80%"></th>
						</tr>
						<tr class="tr1" value="0">
							<td></td>
							<td align="right" id="td1" hidden="true"></td>
							<td align="left" id="exam1"  colspan="4"></td>
							<td></td>
						</tr>
						<tr class="tr2" value="0">
							<td></td>
							<td align="right" id="td2" hidden="true"></td>
							<td align="left" id="exam2"  colspan="4"></td>
							<td></td>
						</tr>
						<tr class="tr3" value="0">
							<td></td>
							<td align="right" id="td3" hidden="true"></td>
							<td align="left" id="exam3"  colspan="4"></td>
							<td></td>
						</tr>
						<tr class="tr4" value="0">
							<td></td>
							<td align="right" id="td4" hidden="true"></td>
							<td align="left" id="exam4"  colspan="4"></td>
							<td></td>
						</tr>
					</table>
				</td>
		</table>
		<p style="margin-left: 30%;">
			<br>
			<button type='button' id="pBtn" class="button" >이전문제</button>
			<button type='button' id="endBtn" class="button" >제출하기</button>
			<button type='button'  id="nBtn" class="button" >다음문제</button>
		</p>
		</div>
		<p id="warBtn">
			&nbsp;&nbsp;시험 시작 시 마우스 <b style="color: #5A63F8">좌클릭</b>을 제외한 모든 입력시 시험이 종료되니 주의하세요 !
		</p>
	</div>
</body>
</html>