<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>candidateTestResult.jsp</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function surveyDo(){
		survey.submit();
	}
	
	function mainDo(){
		location.href="${pageContext.request.contextPath }/candidateMain.do";
	}
</script>
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	<header id="header"></header>
	<h2 align="center">수고하셨습니다.</h2>
	<table class="table text-center">
		<tr>
			<th>시험명</th>
			<td>${examVO.examName}</td>
		</tr>
		<tr>
			<th>응시자명</th>
			<td>${candiVO.takerName}</td>
		</tr>
		<tr>
			<th>정답 / 출제문항</th>
			<td>${takeExamVO.answerCount} / ${examVO.questionQuantity}</td>
		</tr>
		<tr>
			<th>획득점수</th>
			<td>${takeExamVO.sumTakerScore}</td>
		</tr>
		<tr>
			<th>합격점수</th>
			<td>${examVO.passingScore}</td>
		</tr>
		<tr>
			<th>합격 여부</th>
			<td>
				<c:set var="point" value="${takeExamVO.sumTakerScore}"/>
				<c:set var="passingScore" value="${examVO.passingScore}" />
				<c:if test="${passingScore le point}"><font color="blue">합격</font></c:if>
				<c:if test="${passingScore gt point}"><font color="tomato">불합격</font></c:if>
			</td>
		</tr>
	</table>
	<br>
	<div>
		<button class="btn btn-primary" onclick="surveyDo()">문제 해설</button>&nbsp;&nbsp;&nbsp;
		<button class="btn btn-success" onclick="mainDo()">메인으로</button>
	</div>
	<!-- 수정 (7/19) june -->
	<!-- <div align="right"><button onclick="surveyDo()">설문작성 후 문제해설 보기</button>&nbsp;&nbsp;&nbsp;<button onclick="mainDo()">메인으로</button></div> -->
	<form id="survey" name="survey" action="${pageContext.request.contextPath }/candidateSurvey.do/${takeExamVO.takeExamId}/${examVO.examId}"  method="GET">
	</form>
</body>
</html>