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
		$(document).ready(function() {
			$("#header").load("in_header.html")
		});
	</script>
	<header id="header"></header>
	<br>
	<br>
	<!-- 2019.06.28 성재민 -->
	<!-- 이미지 경로 수정, 링크 경로 수정 -->
	<a href="candidateSignUp.do"><img src="${pageContext.request.contextPath}/image/individual.png"></a>
	<a href="companySignUp.do"><img src="${pageContext.request.contextPath}/image/company.png"></a>
	<br>
	<br>
	<br>
	<button onclick="location.href='userMain.html'">돌아가기</button>
</body>