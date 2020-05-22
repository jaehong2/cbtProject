<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		/* 		$(document).ready(function() {
		 $("#header").load("in_header.html")
		 }); */
	</script>
	<header id="header"></header>

	<form action="insertSetExamQuestion.do" method="post">
		<table border="1" align="center">
			<tr>
				<th>EXAM_ID</th>
				<th>QUESTION_ID</th>
				<th>SET_EXAM_QUESTION_ID</th>
				<th>POINT</th>
			</tr>
			<c:forEach var="setExam" items="${result}">
				<tr>
					<td>${setExam.examId}</td>
					<td>${setExam.questionId}</td>
					<td>${setExam.setExamQuestionId}</td>
					<td>${setExam.point}</td>
				</tr>
			</c:forEach>
		</table>
		<div align="center">
			<input type="submit" value="등록"> <input type="reset" value="취소">
		</div>
	</form>
	<br>
	<br>
</body>
</html>