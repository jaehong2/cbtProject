<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table class="table text-center" border="1">
	<thead>
		<tr>
			<th>귀하의 ID는</th>
		</tr>
	</thead>
	<tbody>
		<tr valign="middle">
			<td height="200"> ${findID} 입니다.</td>
		</tr>
	</tbody>
</table>
	<div align="right">
		<a href="${pageContext.request.contextPath }/insertCandidate.do"><button>회원가입</button></a> &nbsp; <a href="candidateMain.do"><button>돌아가기</button></a> &nbsp; <br> <br>
	</div>	

 	<a href = "https://kauth.kakao.com/oauth/authorize?client_id=69907cd9d071e81c5215c21beccec7ee&redirect_uri=http://localhost/project/oauth&response_type=code">
    <img src="${pageContext.request.contextPath}/image/kakaoLogin.jpg">
    </a>
</body>
</html>