<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


<!-- 통합로그인 되면서 삭제처리(7/24) -->
<!-- <div  align="right"><a href="companyLogin.do"><button>기 업 계 정</button></a> &nbsp; <a href="managerLogin.do"><button>관리자계정 </button></a></div> -->
<br>
	<script type="text/javascript">
	function checkForm() {
	    var takerName 	= document.fmField.takerName;
	    var takerEmail 	= document.fmField.takerEmail;
	    // 아이디 입력 유무 체크
	    if(document.fmField.takerName.value == '') {
	        window.alert("이름을 입력하세요");
	    }
	    if(document.fmField.takerEmail.value == ''){
	    	window.alert('이메일을 입력하세요.');
	    	e.preventDefault();
	        return false;
	    }
	    document.fmField.submit();
	}
	</script>
	
	
	<header id="header"></header>
	<form id="fmField" name="fmField" action="findID.do" method="POST">
		<table class="table text-center">
			<thead class="table-success">
				<tr>
					<th colspan="2">
						<h4 class="mx-auto pb-2">ID 찾기</h4>
					</th>
				</tr>
			</thead>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="takerName""></td>
			</tr>
			<tr>
				<td><label>가입된 Email</label></td>
				<td><input type="text" name="takerEmail"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" value="ID찾기" class="btn btn-primary" onclick="checkForm()"/></td>
			</tr>
		</table>
	</form>
	<div align="right">
		<a href="${pageContext.request.contextPath }/insertCandidate.do"><button class="btn btn-primary">회원가입</button></a> &nbsp; <a href="candidateMain.do"><button class="btn btn-warning">돌아가기</button></a><br> <br>
	</div>	

 	<a href = "https://kauth.kakao.com/oauth/authorize?client_id=69907cd9d071e81c5215c21beccec7ee&redirect_uri=http://localhost/project/oauth&response_type=code">
    <img src="${pageContext.request.contextPath}/image/kakaoLogin.jpg">
    </a>
</body>
</html>