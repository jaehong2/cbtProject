<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
var pattern1 = /[0-9]/;	// 숫자 
var pattern2 = /[a-zA-Z]/;	// 문자 
var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자

function openIdChk() {
    var takerId = $("#takerId").val();
     
    if(special_pattern.test(takerId) == true) {
        window.alert("아이디에는 특수문자를 사용하실 수 없습니다");
    	return false; 
    }
    if(takerId.search(/\s/) != -1) {
        window.alert("아이디에는 공백를 사용하실 수 없습니다");
    	return false; 
    }
     if(takerId == '' || !(takerId.length >= 4 && takerId.length <= 12)) {
        window.alert("아이디 자리수를 확인하시오");
        document.fmField.takerId.focus();
        return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
    } 
		$.ajax({
			async : false,
			type : "post",
			url : "idcheck.do",
			dataType : "json",
			data : JSON.stringify($("#fmField").serializeObject()),
			contentType : "application/json; charset=UTF-8",
			success : function(response) {
				console.log(response);
				if (response.result == true) {
					window.alert("사용가능한 아이디입니다.");
					$("#isCheckId").val("true");
					$("#takerId").focus();
				} else {
					window.alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	};
	function checkForm() {
		var takerId = document.fmField.takerId;
		var idDuplication = document.fmField.idDuplication;
		var takerPassword = document.fmField.takerPassword;
		var takerPasswordRe = document.fmField.takerPasswordRe;
		var takerName = document.fmField.takerName;
		var takerInfo = document.fmField.takerInfo;
		var takerEmail = document.fmField.takerEmail;
		
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
		var email = document.fmField.takerEmail.value;

		
		// 아이디 입력 유무 체크
		if (takerId.value == ''
				|| !(takerId.value.length >= 4 && takerId.value.length <= 12)) {
			window.alert("아이디를 입력하시오");
			document.fmField.takerId.focus();
			return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
		}
		
		//if (idck == 0) {
		if ($("#isCheckId").val() != "true") {
			window.alert("아이디 중복 체크를 해주세요.");
			document.fmField.takerId.focus();
			return false;
		}
		// 암호 입력 유무 체크
		if (document.fmField.takerPassword.value == '') {
			window.alert('password를 입력하세요.');
			document.fmField.takerPassword.focus()
			return false;
		}
		// 암호 입력동일 여부 체크
		if (document.fmField.takerPassword.value != document.fmField.takerPasswordRe.value) {
			window.alert('암호를 확인 하세요.');
			document.fmField.takerPassword.focus()
			return false;
		}
		//암호 보안 강화
	    if(!pattern1.test(document.fmField.takerPassword.value) || !pattern2.test(document.fmField.takerPassword.value) || !pattern3.test(document.fmField.takerPassword.value) || document.fmField.takerPassword.value.length < 8) { 
	    	window.alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
	    	return false; 
	    } 
		//  
		if (document.fmField.takerName.value == '') {
			window.alert('이름을 입력하세요.');
			document.fmField.takerName.focus()
			return false;
		}
		if (document.fmField.takerInfo.value == '' ) {
			window.alert('생년월일을 입력하세요.');
			document.fmField.takerInfo.focus()
			return false;
		}
		if (takerInfo.value.length != 6) {
			window.alert('생년월일을 확인하세요.');
			document.fmField.takerInfo.focus()
			return false;
		}
		if (document.fmField.takerEmail.value == '') {
			window.alert('이메일 주소를 입력하세요.');
			document.fmField.takerEmail.focus()
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
		window.alert("회원가입이 정상 처리됩니다");
		document.fmField.submit();
	}
	
	function resetForm() {
		$("#fmField").each(function() {
			$("#isCheckId").val("false");
			this.reset();
		});
	};
</script>
	
	
	
</head>
<body>
	<script type="text/javascript">
/* 		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		}); */
	</script>
	<header id="header"></header>
	<div align="right"><a href="companySignUp.do"><button class="btn btn-primary m-3 p-3">법인회원가입</button></a>&nbsp;&nbsp;
	<a href="candidateMain.do"><button class="btn btn-primary m-3 p-3">돌아가기</button></a></div><br>
	
	<form id="fmField" name="fmField" action="insertCandidate.do" method="post" >
		<table class="table text-center">
			<thead class="table-success">
				<tr>
					<td colspan="2">
						<h4>회원가입 페이지</h4>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>응시자ID</label></td>
					<td align="left">
						<div>
							<input type="text" name="takerId" id="takerId" class="form-control-with-button">&nbsp;
							<input type="button" value="중복확인" onclick="openIdChk();" class="btn btn-info"/>
							<br>
							<font size="1">4~8자 영문/숫자로 구성하여 주세요</font>
							<input type="hidden" id="isCheckId" value="false">
						</div>
					</td>
				</tr>
				<tr>
					<td><label>응시자PW</label></td>
					<td colspan="2" align="left"><input type="password" name="takerPassword" class="form-control" id="takerPassword">
					<font size="1">8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다 </font></td>
				</tr>
				<tr>
					<td><label>PW확인</label></td>
					<td colspan="2" align="left"><input type="password" name="takerPasswordRe" class="form-control" id="takerPasswordRe">
					<font size="1">8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다 </font></td>
				</tr>
				<tr>
					<td>
						<label>성명</label>
					</td>
					<td colspan="2" align="left">
						<input type="text" name="takerName" id="takerName" class="form-control">
					</td>
				</tr>
				<tr>
					<td><label>생년월일</label></td>
					<td colspan="2" align="left">
						<input type="text" name="takerInfo" id="takerInfo" class="form-control">
						<font size="1">6자리로 입력하세요. (ex.YYMMDD) </font>
					</td>
				</tr>
				<tr>
					<td><label>E-mail</label></td>
					<td colspan="2" align="left">
						<input type="text" name="takerEmail" id="takerEmail" class="form-control">
						<font size="1">@가 포함된 형태로 입력하세요 (ex.cbt@cbt.com)</font>
					</td>
				</tr>
				<tr>
					<td><label>최종학력</label></td>
					<td colspan="2" align="left"><select name="takerEducation" class="form-control">
							<option value="J1">중졸</option>
							<option value="J2">고졸</option>
							<option value="J3">초대졸</option>
							<option value="J4">학사</option>
							<option value="J5">석사</option>
							<option value="J6">박사</option>
					</select></td>
				</tr>
				<tr>
					<td><label>연락처</label></td>
					<td colspan="2" align="left">
						<input type="text" name="takerPhoneNum" id="takerPhoneNum" class="form-control">
						<font size="1">숫자로만 입력하세요(ex.01012341234) </font>
					</td>
				</tr>
			</tbody>
		</table>
		<br> <br>
		<div align="center">
			<button type="button" onclick="checkForm()" class="btn btn-primary">가입</button> &nbsp; 
			<input type="button" id="resetBtn" onclick="resetForm()" value="취소" class="btn btn-warning"/> &nbsp;
		</div>
	</form>

</body>
</html>