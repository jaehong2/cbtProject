<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
	
   <img src="${pageContext.request.contextPath}/image/개인시험결과.PNG">
   <a href="candidateSurvey.do"><button>설문작성후 문제해설 보기</button></a>
   <a href="candidateMain.do"><button>메인으로</button></a>
</body>
</html>