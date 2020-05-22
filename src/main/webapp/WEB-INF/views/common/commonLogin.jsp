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
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
	<header id="header"></header>
	ID : <input type="text" id="id"><br>
	PW : <input type="password" id="pw"><br>
	<br>
	<input type="radio" name="user" value="기업">기업
	<input type="radio" name="user" value="응시자">응시자
	<br><br>
	<button onclick="location.href='../manager/managerAccount.jsp'">관리자 계정으로 로그인하기</button>
	<a href="companyLogin.do"><img src="${pageContext.request.contextPath}/image/login_company.png"></a>
	<a href="candidateMain.do"><img src="${pageContext.request.contextPath}/image/login_individual.png"></a>
	<button onclick="location.href='candidateMain.do'">로그인</button><button onclick="location.href='candidateSignUp.do'">회원가입</button><button onclick="location.href='candidateMain.do'">돌아가기</button>
	
</body>
</html>