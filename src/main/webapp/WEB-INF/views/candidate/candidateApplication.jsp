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
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
	<div align="center">
		<h4 class="mx-auto pb-2" >원서접수</h4>
	<hr>	
	</div>
	
	<br>
	<div align="center">
		<h4 class="mx-auto pb-2">시험 안내</h4>
			<img src="${pageContext.request.contextPath}/image/시험안내.PNG" alt="시험 안내">
		<br><br><br><br><br>
		<h2>시험 유의사항</h2>
			<img src="${pageContext.request.contextPath}/image/원서 시험유의사항.PNG" alt="시험 안내">
		<br><br><br><br>
		<button onclick="">원서접수</button>
	</div>
	
</body>
</html>