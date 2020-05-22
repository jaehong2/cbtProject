<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	$(document).ready(function() {
		
	/* 	function testStart(){
			
			window.open('${pageContext.request.contextPath }/candidateTakeExam.do', '시험시작', 'width = 500, height = 500, top = 100, left = 100, status = no , toolbars = no, location = no');
			
		} */
		
		
		var score = ${takeExamId.score};
		
		if (score != 9999) {
			$("[id ='btn']").html('응시결과 확인').attr('id','noId');
			$("[id ='takeExamForm']").attr('action','${pageContext.request.contextPath }/candidateTestResult.do');
			alert('응시 완료한 시험입니다.');
		} else if (nowDate <= sDate) {
			$("[id ='btn']").hide();
			alert('시간 확인.');
		} else if (nowDate >= eDate) {
			$("[id ='btn']").hide();
			alert('종료된 시험입니다.');
		}
		
		console.log(serverDate);
		console.log("서버시간 : " + nowDate);
		console.log("시험시작 : " + sDate);
		console.log("시험종료 : " + eDate);
		
		$("[id ='noId']").click(function() {
			takeExamForm.method	=	"post";
			takeExamForm.submit();
		})
		
		$("[id ='btn']").click(function() {
			
			
			var url		=	'${pageContext.request.contextPath }/candidateTakeExam.do';
			var title	=	'시험시작';
			var status	=	'width = 550, height = 200, top = 300, left = 500, status = no , toolbars = no, location = no';

			window.open("",title,status);
			
			
			takeExamForm.target	=	title;
			takeExamForm.action	=	url;
			takeExamForm.method	=	"post";
			
			takeExamForm.submit();
		
		});
	
	})

	/* 시간비교를 위한 치환 펑션  */
	function parse(str) {
		var y = str.substr(0, 4);
		var mon = str.substr(5, 2);
		var d = str.substr(8, 2);
		var h = str.substr(11, 2);
		var min = str.substr(14, 2);

		return new Date(y, mon - 1, d, h, min);
	}

	let xmlHttp;

	if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
	}
	
	xmlHttp.open('HEAD', window.location.href.toString(), false);
	xmlHttp.setRequestHeader("Content-Type", "text/html");
	xmlHttp.send('');

	let serverDate = xmlHttp.getResponseHeader("Date");

	/* 서버의 현재 시간 */
	let nowDate = new Date(serverDate);

	/* 시험시작시간 */
	let sDate = parse("${detailExam.examStartTime}");
	/* 시험종료시간 */
	let eDate = parse("${detailExam.examEndTime}");

	/* function getTimeStamp() {
		var d = new Date(serverDate);
		var s =
			leadingZeros(d.getFullYear(), 4) + '-' +
			leadingZeros(d.getMonth() + 1, 2) + '-' +
			leadingZeros(d.getDate(), 2) + ' ' +
			
			leadingZeros(d.getHours(), 2) + ':' +
			leadingZeros(d.getMinutes(), 2);
	
		alert(s);
		var date = parse(s);
		alert(date);
		alert(d);
		alert(sDate);
		alert(eDate);
	}
	
	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
		
		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
			zero += '0';
		}
		return zero + n;
	} */
</script>
</head>
<body>
	<form id="takeExamForm" name="takeExamForm">
		<input type="text" id="eId" name="examId" value="${detailExam.examId }" hidden="true">
		<input type="text" id="tId" name="takeExamId" value="${takeExamId.takeExamId }" hidden="true">
	</form>

	<header id="header"></header>
	
	<div class="container">
		<input type="hidden" name="no" value="">
		<table class="table text-center">
			<thead class="table-success">
				<tr>
					<th colspan="2">
						<h4>시험 상세 보기</h4>
					</th>
				</tr>
			</thead>
			<tr>
				<th width="150px">시험이름</th>
				<td id="mainExamName">${detailExam.examName}</td>
			</tr>
			<!-- 2019.07.25 성재민 -->
			<!-- 비공개 시험 일때 해당 응시자가 응시 가능 한 시험이면-->
			<!-- 시험 디테일이 나오고 -->
			<!-- 응시 할수 없는 시험이라면 -->
			<!-- 비공개 시험이라는 메시지 출력 -->
			<c:if test="${detailExam.disclosureStatus == 'O2'}">
				<!-- 값 비교 체크를 위한 변수 isMatch 선언 -->
				<c:set var="isMatch" value="N"></c:set>
				<!-- 응시자가 응시 할수 있는 비공개 시험 LIST 를 가져와서 -->
				<!-- 리스트 안의 값과 현재 시험의 시험 ID 를 비교하여 -->
				<!-- 같은 값이 있으면 isMatch를 Y 로 변경 -->
				<c:forEach items="${privateExamList}" var="privateExam">
					<c:if test="${detailExam.examId == privateExam.examId}">
						<c:set var="isMatch" value="Y"></c:set>
					</c:if>
				</c:forEach>
				<!-- isMatch가 Y 라면 응시 가능 하므로 시험 정보 표시 -->
				<c:if test="${isMatch == 'Y'}">
					<tr>
						<th>시험시간</th>
						<td>${detailExam.examStartTime}~ ${detailExam.examEndTime}</td>
					</tr>
					<tr>
						<th>문항수</th>
						<td>${detailExam.questionQuantity}</td>
					</tr>
					<tr>
						<th>응시가능 횟수</th>
						<td>${detailExam.numberOfTimes}</td>
					</tr>
					<tr>
						<th>합격 점수</th>
						<td>${detailExam.passingScore}</td>
					</tr>
					<tr>
						<th>응시가능 인원</th>
						<td>${detailExam.applicants}</td>
					</tr>
					<tr>
						<th>시험상태</th>
						<c:if test="${detailExam.examStatus == 'D1'}">
							<td>시험전</td>
						</c:if>
						<c:if test="${detailExam.examStatus == 'D2'}">
							<td>시험중</td>
						</c:if>
						<c:if test="${detailExam.examStatus == 'D3'}">
							<td>시험완료</td>
						</c:if>
					</tr>
					<tr>
						<th>시험설명(간략)</th>
						<td>${detailExam.examDescriptionSimple}</td>
					</tr>
					<tr>
						<th>시험설명(상세)</th>
						<td>${detailExam.examDescriptionDetail}</td>
					</tr>
				</c:if>
				<!-- isMatch가 N 라면 응시 가능 하므로 비공개 시험이라 응시가 되지 않는 다는 정보 표시 -->
				<c:if test="${isMatch == 'N'}">
					<td colspan="2"><br>
					<br>
					<br>
						<h2>
							본 시험은 비공개 시험입니다. <br>
							<br> 응시대상자이신지 확인하여 주세요
						</h2> <br>
					<br>
					<br></td>
				</c:if>
			</c:if>

			<c:if test="${detailExam.disclosureStatus == 'O1'}">
				<tr>
					<th>시험시간</th>
					<td>${detailExam.examStartTime}~ ${detailExam.examEndTime}</td>
				</tr>
				<tr>
					<th>문항수</th>
					<td>${detailExam.questionQuantity}</td>
				</tr>
				<tr>
					<th>응시가능 횟수</th>
					<td>${detailExam.numberOfTimes}</td>
				</tr>
				<tr>
					<th>합격 점수</th>
					<td>${detailExam.passingScore}</td>
				</tr>
				<tr>
					<th>응시가능 인원</th>
					<td>${detailExam.applicants}</td>
				</tr>
				<tr>
					<th>시험상태</th>
					<c:if test="${detailExam.examStatus == 'D1'}">
						<td>시험전</td>
					</c:if>
					<c:if test="${detailExam.examStatus == 'D2'}">
						<td>시험중</td>
					</c:if>
					<c:if test="${detailExam.examStatus == 'D3'}">
						<td>시험완료</td>
					</c:if>
				</tr>
				<tr>
					<th>시험설명(간략)</th>
					<td>${detailExam.examDescriptionSimple}</td>
				</tr>
				<tr>
					<th>시험설명(상세)</th>
					<td>${detailExam.examDescriptionDetail}</td>
				</tr>
			</c:if>
		</table>
		<br>
		<div align="right">
			<button type="button" class="btn btn-primary" id="btn" value="${detailExam.examId}">응시하기</button>
			<input type="button" class="btn btn-warning" onclick="location.href = '${pageContext.request.contextPath }/candidateScheduleCheck.do'" value="돌아가기">
		</div>
	</div>
</body>
</html>