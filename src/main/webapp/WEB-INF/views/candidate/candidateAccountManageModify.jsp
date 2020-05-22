<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<style type="text/css">
	.trexam {cursor: pointer; }
	 tr.trexam:hover { background-color: lightblue; } 
	thead {background-color: lightgrey}
</style>
<script>
function openMailChk() {
	
	$.ajax({
		async : false,
		type : "post",
		url : "Emailcheck.do",
		dataType : "json",
		data : JSON.stringify($("#fmField").serializeObject()),
		contentType : "application/json; charset=UTF-8",
		success : function(response) {
			console.log(response);
			if (response.result == true) {
				window.alert("사용가능한 메일입니다.");
				idck = 1
			} else {
				window.alert("이미 사용중인 EMAIL 주소입니다.");
			}
		},
		error : function(error) {
			console.log(error);
		}
	});
};
function checkForm() {
	var takerPassword = document.fmField.takerPassword;
	var takerPasswordRe = document.fmField.takerPasswordRe;
	var pattern1 = /[0-9]/;	// 숫자 
	var pattern2 = /[a-zA-Z]/;	// 문자 
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	var takerName = document.fmField.takerName;
	var takerInfo = document.fmField.takerInfo;
	var takerPhoneNum = document.fmField.takerPhoneNum;
	
	var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
	var email = document.fmField.takerEmail.value;
	
	
	if (document.fmField.takerPassword.value != document.fmField.takerPasswordRe.value) {
		window.alert('password가 일치하지 않습니다');
		document.fmField.takerPassword.focus()
		return false;
	}
	//암호 보안 강화
    if(!pattern1.test(document.fmField.takerPassword.value) || !pattern2.test(document.fmField.takerPassword.value) || !pattern3.test(document.fmField.takerPassword.value) || document.fmField.takerPassword.value.length < 8) { 
    	window.alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
    	return false; 
    } 
	if (takerInfo.value.length != 6) {
		window.alert('생년월일을 확인하세요.');
		document.fmField.takerInfo.focus()
		return false;
	}
	if( regEmail.test(email) == false) {
		window.alert('올바른 이메일형태가 아닙니다');
		document.fmField.takerEmail.focus()
		return false;
	}
	if (document.fmField.takerPhoneNum.value == '') {
		window.alert('연락처를 입력하세요.');
		document.fmField.takerPhoneNum.focus()
		return false;
	}
	if (takerPhoneNum.value.length < 11 || takerPhoneNum.value.length > 13) {
		window.alert("연락처를 입력하시오");
		document.fmField.takerPhoneNum.focus();
		return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
	}
	window.alert("정보가 정상적으로 전달되었습니다");
	document.fmField.submit();
}
</script>
</head>
<body>
	<!-- 마이페이지<개인> 계정관리-->
	<h4 class="mx-auto pb-2">계정관리</h4>
<%-- 	<form action="${pageContext.request.contextPath }/updateCandidate.do" method="post"> --%>
		<form id="fmField" name="fmField" action="updateCandidate.do" method="post">
		<table class="table text-center">
			<thead class="table-success">
				<tr>
					<th colspan="2"><h4>${candidate.takerName}님의 정보입니다.</h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>ID</label></td>
					<td align="left">
						<input type="hidden" name="takerId" class="form-control" value="${candidate.takerId}" readonly="readonly"/>${candidate.takerId}
					</td>
				</tr>
	 			<tr>
					<td><label>패스워드</label></td>
					<td align="left"><input type="password" name="takerPassword" class="form-control"/></td>
				</tr> 
	 			<tr>
					<td><label>패스워드확인</label></td>
					<td align="left"><input type="password" name="takerPasswordRe" class="form-control"/></td>
				</tr> 
				<tr>
					<td><label>이름</label></td>
					<td align="left"><input type="hidden" name="takerName" class="form-control" readonly="readonly"/>${candidate.takerName}</td>
				</tr>
				<tr>
					<td><label>생년월일</label></td>
					<td align="left"><input type="text" name="takerInfo" class="form-control" value="${candidate.takerInfo}"/></td>
				</tr>
				<tr>
					<td><label>E-mail</label></td>
					<td align="left">
						<div>
							<input type="text" name="takerEmail" value="${candidate.takerEmail}" class="with-button">&nbsp;
							<input type="button" value="메일변경" onclick="openMailChk();" class="btn btn-info">
						</div>
					</td>
				</tr>
				<tr>
					<td><label>연락처</label></td>
					<td align="left"><input type="text" name="takerPhoneNum" class="form-control" value="${candidate.takerPhoneNum}" /></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" onclick="checkForm()" class="btn btn-primary">수정</button>&nbsp; <input type="reset" value="취소" class="btn btn-warning"/></td>
				</tr>
			</tbody>
		</table>
		<!--테이블 끝-->
	</form>
	<div align="right"><a href="candidateMain.do"><button class="btn btn-primary m-3 p-3">돌아가기</button></a></div><br>
</body>
