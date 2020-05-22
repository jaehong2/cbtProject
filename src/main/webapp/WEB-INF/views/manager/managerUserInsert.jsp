<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<script src="${pageContext.request.contextPath}/js/json.min.js"></script>

<script>
	$(document).ready(function() {
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var pattern1 = /[0-9]/;	// 숫자 
		var pattern2 = /[a-zA-Z]/;	// 문자 
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	
		$("#idCheckBtn").click(function() {
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
		        $("#takerId").focus();
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
		});
		
		$("#joinBtn").click(function() {
			var takerId 		= $("#takerId").val();
			var idDuplication 	= $("#idDuplication").val();
			var takerPassword 	= $("#takerPassword").val();
			var takerPasswordRe = $("#takerPasswordRe").val();
			var takerName 		= $("#takerName").val();
			var takerInfo 		= $("#takerInfo").val();
			var takerEmail 		= $("#takerEmail").val();
			var takerPhoneNum 	= $("#takerPhoneNum").val();
			
			var regEmail 		= /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
			var email 			= $("#takerEmail").val();
		
			// 아이디 입력 유무 체크
			if (takerId == '' || !(takerId.length >= 4 && takerId.length <= 12)) {
				window.alert("아이디를 입력하시오");
				$("#takerId").focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			//if (idck == 0) {
			if ($("#isCheckId").val() != "true") {
				window.alert("아이디 중복 체크를 해주세요.");
				$("#takerId").focus();
				return false;
			}
			
			// 암호 입력 유무 체크
			if (takerPassword == '') {
				window.alert('password를 입력하세요.');
				$("#takerPassword").focus();
				return false;
			}
			
			// 암호 입력동일 여부 체크
			if (takerPassword != takerPasswordRe) {
				window.alert('암호를 확인 하세요.');
				$("#takerPassword").focus();
				return false;
			}
			
			//암호 보안 강화
		    if(!pattern1.test(takerPassword) || 
		    		!pattern2.test(takerPassword) || 
		    		!pattern3.test(takerPassword) || 
		    		takerPassword.length < 8) { 
		    	window.alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
		    	return false; 
		    } 
			
			//  
			if (takerName == '') {
				window.alert('이름을 입력하세요.');
				$("#takerName").focus();
				return false;
			}
			
			if (takerInfo == '' ) {
				window.alert('생년월일을 입력하세요.');
				$("#takerInfo").focus();
				return false;
			}
			
			if (takerInfo.length != 6) {
				window.alert('생년월일을 확인하세요.');
				$("#takerInfo").focus();
				return false;
			}
			
			if(regEmail.test(email) == false){
				window.alert('올바른 이메일형태가 아닙니다');
				$("#takerEmail").focus();
				return false;
			}
			
			if (takerEmail == '') {
				window.alert('이메일 주소를 입력하세요.');
				$("#takerEmail").focus();
				return false;
			}
			
			if (takerPhoneNum == '') {
				window.alert('연락처를 입력하세요.');
				$("#takerPhoneNum").focus();
				return false;
			}
			
			if (takerPhoneNum.length < 11 || takerPhoneNum.length > 13) {
				window.alert("연락처를 입력하시오");
				$("#takerPhoneNum").focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			window.alert("회원가입이 정상 처리됩니다");
			$("#fmField").submit();
		});
	});
	
	$("#backBtn").click(function() {
		
	});
</script>
	<h4 class="mx-auto pb-2" >응시자 등록 페이지(관리자 화면)</h4>
	<br>	

	<form id="fmField" action="${pageContext.request.contextPath }/managerUserInsert.do" method="post" enctype="application/x-www-form-urlencoded">
		<table class="table text-center">
			<tr>
				<th>
					<label>응시자ID</label>
				</th>
				<td>
					<input type="text" name="takerId" id="takerId" class="form-control">&nbsp;
					<input type="button" value="중복확인" id="idCheckBtn" class="btn btn-primary"/>
					<font size="1">4~8자 영문/숫자로 구성하여 주세요</font>
					<input type="hidden" id="isCheckId" value="false">
				</td>
			</tr>
			<tr>
				<th>
					<label>비밀번호</label>
				</th>
				<td>
					<input type="password" name="takerPassword" class="form-control" id="takerPassword">
					<font size="1">8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다 </font>
				</td>
			</tr>
			<tr>
				<th>
					<label>비밀번호확인</label>
				</th>
				<td>
					<input type="password" name="takerPasswordRe" class="form-control" id="takerPasswordRe">
					<font size="1">8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다 </font>
				</td>
			</tr>
				
			<tr>
				<th>
					<label>이름</label>
				</th>
				<td>
					<input type="text" name="takerName" id="takerName" class="form-control">
				</td>
			</tr>
			<tr>
				<th>
					<label>생년월일</label>
				</th>
				<td>
					<input type="text" name="takerInfo" id="takerInfo" class="form-control"
					onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="6">
					<font size="1">6자리로 입력하세요. (ex.YYMMDD) </font>
				</td>
			</tr>
			<tr>
				<th>
					<label>최종학력</label>
				</th>
				<td>
					<my:select items="${J}" name="takerEducation" value="${result.takerEducation }"></my:select>
				</td>
			</tr>
			<tr>
				<th>
					<label>E-mail</label>
				</th>
				<td>
					<input type="text" name="takerEmail" id="takerEmail" class="form-control">
					<font size="1">@가 포함된 형태로 입력하세요 (ex.cbt@cbt.com)</font>
				</td>
			</tr>
			<tr>
				<th>
					<label>연락처</label>
				</th>
				<td>
					<input type="text" name="takerPhoneNum" id="takerPhoneNum" class="form-control"
					onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11">
					<font size="1">숫자로만 입력하세요(ex.01012341234) </font>
				</td>
			</tr>
		</table>
		<br>
		<input type="button" id="joinBtn" value="등록" class="btn btn-primary m-3 p-3">
		<input type="button" id="backBtn" class="btn btn-warning m-3 p-3" onclick="location.href='managerUserAccountList.do'" value="돌아가기">
	</form>

</body>
</html>
    