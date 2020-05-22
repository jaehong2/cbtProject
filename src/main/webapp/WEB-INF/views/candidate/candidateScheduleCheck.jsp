<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
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
	
	tr {
		margin: 6px;
		font: large;
		transition : width, 1s, ease, 0.4s;
		border-collapse: collapse;
		border: none;
		border-radius: 25px;
	}
	
</style>
<script>

	$(document).ready(function(){
		var arrTD = $("td[id^='Exam_List_']");
		for(var i = 0; i < arrTD.length; ++i){
			$(arrTD[i]).text($(arrTD[i]).text().replace("T"," "))
		}
	});
	
	function goList(p){
		searchFrm.page.value = p;
		searchFrm.submit();
	}
	
	// 로그인체크후 로그인하러가기     2019.07.20 김재용 --> 통합화 이후 미사용
	/* function goLogin(){
		alert('로그인이 필요한 서비스입니다.');
		location.href="${pageContext.request.contextPath }/candidateLogin.do";
	} */

</script>
<title>CBT 시험 일정 확인</title>
<style type="text/css">
	.trexam {cursor: pointer; }
	 tr.trexam:hover { background-color: lightblue; } 
	thead {background-color: lightgrey}
</style>
</head>
<body>
	<h4 class="mx-auto pb-2">응시가능한 시험</h4>
	<br>
	<form name="searchFrm">
		<input type = "hidden" name="page" value="1">
	</form>

	<table class="table text-center">
	<thead class="table-success">
		<tr>
			<th>시험명</th>
			<th>시험시작시간</th>
			<th>시험종료시간</th>
			<th>문항수</th>
			<th>합격기준</th>
			<th>공개 여부</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="takerId" value="${takerId}"></c:set>
   	<c:forEach items="${candidateScheduleCheck.schedulePage}" var="examInfo" >
<%--    	<c:if test="${takerId != null}"> --%>
		<tr onclick="location.href='candidateExamDetialView.do/${examInfo.EXAM_ID}'" class="trexam">
<%-- 	</c:if>
	<c:if test="${takerId == null}">
		<tr onclick="goLogin();">
	</c:if> --%>
			<td>${examInfo.EXAM_NAME}</td>
			<td>${examInfo.EXAM_START_TIME}</td>
			<td>${examInfo.EXAM_END_TIME}</td>
			<td>${examInfo.QUESTION_QUANTITY}</td>
			<td>${examInfo.PASSING_SCORE}</td>
			<td>
				<c:if test="${examInfo.DISCLOSURE_STATUS eq 'O1'}"><font color="blue">공개</font></c:if>
				<c:if test="${examInfo.DISCLOSURE_STATUS eq 'O2'}"><font color="tomato">비공개</font></c:if>
			</td>
		</tr>
	</c:forEach>  
	</tbody>
	</table><br>

	<div align="center"><my:paging jsFunc="goList" paging="${candidateScheduleCheckPage.paging}"/></div><br>
	
	<div align="right"><a href="candidateMain.do"><button class="btn btn-primary">돌아가기</button></a></div>&nbsp;&nbsp;&nbsp;
</body>
</html>