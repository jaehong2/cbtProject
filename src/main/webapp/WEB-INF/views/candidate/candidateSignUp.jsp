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
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
   <br>
   <br>
	<a href="candidateInSignUp.do"><img src="${pageContext.request.contextPath}/image/individual.png"></a>
	<a href="companyCoSignUp.do"><img src="${pageContext.request.contextPath}/image/company.png"></a>
	<br><br>
	<br>
	<a href="candidateMain.do"><button>돌아가기</button></a>
</body>
</html>