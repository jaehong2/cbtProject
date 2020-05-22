<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <font color="red">
        <p>로그인 정보가 다릅니다 !!<br/>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
    </font>
</c:if>

</head>
<body>

<!-- 통합로그인 되면서 삭제처리(7/24) -->
<!-- <div  align="right"><a href="companyLogin.do"><button>기 업 계 정</button></a> &nbsp; <a href="managerLogin.do"><button>관리자계정 </button></a></div> -->
<br>
	<script type="text/javascript">
	function checkForm() {
	    var takerId 		= document.fmField.takerId;
	    var takerPassword 	= document.fmField.takerPassword;
	    // 아이디 입력 유무 체크
	    if(takerId.value == '') {
	        window.alert("아이디를 입력하세요");
	    }
	    if(document.fmField.takerPassword.value == ''){
	    	window.alert('암호를 입력하세요.');
	    	e.preventDefault();
	        return false;
	    }
	    document.fmField.submit();
	}
	</script>
	
	
	<header id="header"></header>
	<form id="fmField" name="fmField" action="processLogin.do" method="POST">
	<div align="center">
		<div class="col-sm-6" >
			<table class="table text-center">
				<thead>
					<tr>
						<th class="table th" colspan="2"><h4><b>로그인</b></h4></th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td colspan="2" align="center"><img src="${pageContext.request.contextPath}/image/LogIn.png"/></td>
				</tr> 
					<tr>
						<td><label>ID</label></td>
						<td>	
							<input type="text" name="takerId" value="${candidateVO.takerId}" class="form-control">
						</td>
					</tr>
					<tr>
						<td><label>PW</label></td>
						<td>
							<input type="password" name="takerPassword" class="form-control">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" class="btn btn-primary" value="로그인" onclick="checkForm()"/>&nbsp; 
							<input type="reset" class="btn btn-primary" value="취소" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</form>
	<br/>
	<div align="center">
		<a href="${pageContext.request.contextPath }/insertCandidate.do"><button class="btn btn-warning">회원가입</button></a> &nbsp; <a href="candidateMain.do"><button class="btn btn-warning">돌아가기</button></a> &nbsp; <a href="${pageContext.request.contextPath }/findID.do"><button class="btn btn-warning">ID찾기</button></a> <br> <br>
	</div>	

 	<a href = "https://kauth.kakao.com/oauth/authorize?client_id=c26738f5694564442fa900de9d855473&redirect_uri=http://localhost/project/oauth&response_type=code">
    	<img src="${pageContext.request.contextPath}/image/kakaoLogin.jpg">
    </a>
</body>
</html>