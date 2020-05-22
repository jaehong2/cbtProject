<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 2019.07.10 성재민 -->
<!-- 로그인 실패시 알림창 출력 -->
<c:if test="${not empty loginFail}">
	<script type="text/javascript">
		alert("로그인 오류.\nID와 비밀번호를 다시 입력해 주세요.");
	</script>
</c:if>
</head>
<body>
<div  align="right"><a href="${pageContext.request.contextPath }/candidateLogin.do"><button>개 인 계 정</button></a> &nbsp; <a href="managerLogin.do"><button>관리자계정 </button></a></div>
<br>
	<form action="companyLogin.do" method="post">
		<table border="1" align="center" class="table text-center">
			<tr>
				<td colspan="2" align="center"><img src="${pageContext.request.contextPath}/image/company.jpg"/><br></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="companyId"value="${companyVO.companyId}"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="companyPassword"></td>
			</tr>
			<tr><td colspan="2"><button>기업로그인</button></td></tr>
		</table>
	</form>
	<a href="${pageContext.request.contextPath }/companySignUp.do"><button>가입하기</button></a>
	
	<a href="${pageContext.request.contextPath }/candidateMain.do"><button>돌아가기</button></a>
</body>
</html>