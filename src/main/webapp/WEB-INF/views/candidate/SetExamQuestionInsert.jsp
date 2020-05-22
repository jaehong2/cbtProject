<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<td><label>EXAM_ID</label></td>
				<td><input type="text" name="examId" id="examId" class="form-control"></td>
			</tr>
			<tr>
				<td><label>QUESTION_ID</label></td>
				<td><input type="text" name="questionId" id="questionId" class="form-control"></td>
			</tr>
			<tr>
				<td><label>SET_EXAM_QUESTION_ID</label></td>
				<td><input type="hidden" name="setExamQuestionId" id="setExamQuestionId" class="form-control"></td>
			</tr>
			<tr>
				<td><label>POINT</label></td>
				<td><input type="text" name="point" id="point" class="form-control"></td>
			</tr>
		</table>
		<div align="center">
			<input type="submit" value="등록" class="btn btn-primary m-3 p-3">
			<input type="reset" value="취소" class="btn btn-primary m-3 p-3">
		</div>
	</form>
	<br>
	<br>
</body>
</html>