<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var specialPattern 	= /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	var pattern1 		= /[0-9]/;	// 숫자 
	var pattern2 		= /[a-zA-Z]/;	// 문자 
	var pattern3 		= /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	
	$(document).ready(function(){
		$("#idCheckBtn").click(function() {
			var companyId = $("#companyId").val();
		     
		    if(specialPattern.test(companyId) == true) {
		        window.alert("아이디에는 특수문자를 사용하실 수 없습니다");
		    	return false; 
		    }
		    
		    if(companyId.search(/\s/) != -1) {
		        window.alert("아이디에는 공백를 사용하실 수 없습니다");
		    	return false; 
		    }
		    
		    if(companyId == '' || !(companyId.length >= 4 && companyId.length <= 12)) {
		        window.alert("아이디 자리수를 확인하시오");
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
					} else {
						window.alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		
		$("#businessNumberCheckBtn").click(function() {
			var businessNumber = $("#businessNumber").val();
			
			if(businessNumber == '') {
		        window.alert("사업자 번호를 입력하세요.");
		        return false; 
		    } 
			
			if(businessNumber.length != 10) {
		        window.alert("사업자 번호 자리수를 확인하세요");
		        return false; 
		    } 
			
			$.ajax({
				type : "post",
				url : "businessNumCheck.do/" + businessNumber,
				success : function(response) {
					if (response.result == true) {
						window.alert("사용가능한 사업자 번호입니다.");
						$("#isCheckBisinessNumber").val("true");
					} else {
						window.alert("사업자 번호가 존재합니다. 다른 번호를 입력해주세요.");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		
		$("#resetBtn").click(function() {
			$("#fmField").each(function() {
				$("#isCheckId").val("false");
				$("#isCheckBisinessNumber").val("false");
				this.reset();
			});
		});
		
		// id체크를 재사용하기 위해 companyId -> takerId로 변경
		$("#joinBtn").click(function() {
			var regEmail 		= /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
			var companyId 		= document.fmField.companyId;
			//var idDuplication 	= document.fmField.idDuplication;
			var companyPassword = document.fmField.companyPassword;
			var companyPwCheck 	= document.fmField.companyPwCheck;
			
			// 2019.07.31 성재민
			// 입력 체크 추가
			var companyName		= $("#companyName").val();
			var businessNumber	= $("#businessNumber").val();
			var classification	= $("#companyClassification").val();
			var companySectors	= $("#companySectors").val();
			var companyCredit	= $("#companyCredit").val();
			var companyManager	= $("#companyManager").val();
			var companyTelNum	= $("#companyManagerTelNum").val();
			var companyEmail	= $("#companyEmail").val();
			
			console.log(companyId.value);
			console.log(companyPassword.value);
			console.log(companyPwCheck.value);
			
			console.log(companyName);
			console.log(businessNumber);
			console.log(classification);
			console.log(companySectors);
			console.log(companyCredit);
			console.log(companyManager);
			console.log(companyTelNum);
				
			// 아이디 입력 유무 체크
			if (companyId.value == '' || !(companyId.value.length >= 4 && companyId.value.length <= 12)) {
				window.alert("아이디를 입력하시오");
				$("#companyId").focus();
				return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
			}
			
			if ($("#isCheckId").val() != "true") {
				window.alert("아이디 중복 체크를 해주세요.");
				return false;
			}
			
			if ($("#isCheckBisinessNumber").val() != "true") {
				window.alert("사업자번호 중복 체크를 해주세요.");
				return false;
			}		
			
			// 암호 입력 유무 체크
			if (document.fmField.companyPassword.value == '') {
				window.alert('password를 입력하세요.');
				$("#companyPassword").focus();
				return false;
			}
			
			// 암호 입력동일 여부 체크
			if (document.fmField.companyPassword.value != document.fmField.companyPwCheck.value) {
				window.alert('암호를 확인 하세요.');
				$("#companyPassword").focus();
				return false;
			}
			
			//암호 보안 강화
			if(!pattern1.test(document.fmField.companyPassword.value) || 
				!pattern2.test(document.fmField.companyPassword.value) || 
				!pattern3.test(document.fmField.companyPassword.value) || 
				document.fmField.companyPassword.value.length < 8) { 
				window.alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
				$("#companyPassword").focus();
			    	return false; 
			} 
			
			console.log(companyName);
			console.log(businessNumber);
			console.log(classification);
			console.log(companySectors);
			console.log(companyCredit);
			console.log(companyManager);
			console.log(companyTelNum);
			
			// 2019.07.31 성재민
			// 입력 체크
			if (companyName == '') {
				window.alert('기업명을 입력하세요.');
				$("#companyName").focus();
				return false;
			}
			
			if (businessNumber == '') {
				window.alert('사업자번호를 입력하세요.');
				$("#businessNumber").focus();
				return false;
			}
			
			if (classification == '-1') {
				window.alert('회사분류를 선택하세요.');
				$("#companyClassification").focus();
				return false;
			}
			
			if (companySectors == '-1') {
				window.alert('세부업종을 선택하세요.');
				$("#companySectors").focus();
				return false;
			}
			
			if (companyCredit == '') {
				window.alert('주거래 은행을 입력하세요.');
				$("#companyCredit").focus();
				return false;
			}
			
			if (companyManager == '') {
				window.alert('담당자를 입력하세요.');
				$("#companyManager").focus();
				return false;
			}
			
			if (companyTelNum == '') {
				window.alert('연락처를 입력하세요.');
				$("#companyManagerTelNum").focus();
				return false;
			}
			
			if (companyEmail == '') {
				window.alert('이메일을 입력하세요.');
				$("#companyEmail").focus();
				return false;
			}
			
			if( regEmail.test(companyEmail) == false) {
				window.alert('올바른 이메일형태가 아닙니다');
				$("#companyEmail").focus();
				return false;
			}
			
			window.alert("회원가입이 정상 처리됩니다");
			document.fmField.submit();
		});
	});
</script>
</head>
<body>
	<header id="header"></header>
	<div align="right">
		<a href="${pageContext.request.contextPath}/insertCandidate.do"><button class="btn btn-primary m-3 p-3">개인회원가입</button></a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/candidateMain.do"><button class="btn btn-primary m-3 p-3">돌아가기</button></a>
	</div>
	<br>
	
	<form id="fmField" name="fmField"  action="companySignUp.do" method="post">
		<table class="table text-center">
			<thead class="table-secondary">
				<tr>
					<td colspan="2">
						<h4>기업 회원 가입 페이지</h4>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>기업ID</label></td>
					<td align="left">
						<input type="text" name="companyId" id="companyId" class="form-control-with-button">&nbsp;
						<input type="button" id="idCheckBtn" value="중복확인" class="btn btn-info"/>
						<font size="1">4~8자 영문/숫자로 구성하여 주세요</font>
						<input type="hidden" id="isCheckId" value="false">
					</td>
				</tr>
				<tr>
					<td><label>기업PW</label></td>
					<td align="left">
						<input type="password" name="companyPassword" id="companyPassword" class="form-control">
						<font size="1">8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다 </font>
					</td>
				</tr>
				<tr>
					<td><label>PW확인</label></td>
					<td align="left">
						<input type="password" name="companyPwCheck" id="companyPwCheck" class="form-control">
						<font size="1">8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다 </font>
					</td>
				</tr>
				<tr>
					<td><label>기업명</label></td>
					<td align="left">
						<input type="text" name="companyName" id="companyName" class="form-control">
					</td>
				</tr>
				<tr>
					<td><label>사업자번호</label></td>
					<td align="left">
						<input type="text" name="businessNumber" id="businessNumber" class="form-control-with-button" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="10">
						&nbsp;
						<input type="button" id="businessNumberCheckBtn" value="중복확인" class="btn btn-info"/>
						<font size="1">숫자로만 입력하세요.(ex.4353534534)</font>
						<input type="hidden" id="isCheckBisinessNumber" value="false">
					</td>
				<tr>
					<td><label>회사분류</label></td>
					<td align="left">
						<select name="companyClassification" id="companyClassification" class="form-control">
							<option value="-1">-회사분류를 선택하세요-</option>
							<c:forEach items="${companyClassificationList}" var="companyClassificationItem">
								<option value="${companyClassificationItem.detailCd}">${companyClassificationItem.detailNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>세부업종</label></td>
					<td align="left">
						<select name="companySectors" id="companySectors" class="form-control">
							<option value="-1">-세부업종를 선택하세요-</option>
							<c:forEach items="${companySectorsList}" var="companySectorItem">
								<option value="${companySectorItem.detailCd}">${companySectorItem.detailNm}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>주거래 은행</label></td>
					<td align="left"><input type="text" name="companyCredit" id="companyCredit" class="form-control"></td>
				</tr>
				<tr>
					<td><label>담당자</label></td>
					<td align="left"><input type="text" name="companyManager" id="companyManager" class="form-control"></td>
				</tr>
				<tr>
					<td><label>연락처</label></td>
					<td align="left">
						<input type="text" name="companyManagerTelNum" id="companyManagerTelNum" class="form-control" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="10">
						<font size="1">숫자로만 입력하세요(ex.01012341234) </font>
					</td>
				</tr>
				<tr>
					<td><label>E-mail</label></td>
					<td align="left">
						<input type="text" name="companyEmail" id="companyEmail" class="form-control">
						<font size="1">@가 포함된 형태로 입력하세요 (ex.cbt@cbt.com)</font>
					</td>
				</tr>
			</tbody>
		</table>
		<br> <br>
		<div align="center">
			<button type="button" id="joinBtn" class="btn btn-info">가입</button>&nbsp;&nbsp;&nbsp; 
			<!-- <input type="submit" value="가입" class="btn btn-primary m-3 p-3">
			<input type="reset" value="취소" class="btn btn-warning m-3 p-3"> -->
			<input type="button" id="resetBtn" value="취소" class="btn btn-warning"/> &nbsp;
		</div>
	</form>
	<br>
	<br>
</body>
</html>