<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
function checkForm() {
    var managerId 		= document.fmField.managerId;
    var managerPassword 	= document.fmField.managerPassword;
    // 아이디 입력 유무 체크
    if(managerId.value == '') {
        window.alert("아이디를 입력하세요");
    }
    if(document.fmField.managerPassword.value == ''){
    	window.alert('암호를 입력하세요.');
    	e.preventDefault();
        return false;
    }
    document.fmField.submit();
}
</script>

<div  align="right"><a href="candidateLogin.do"><button>개 인 계 정</button></a> &nbsp; <a href="companyLogin.do"><button>기 업 계 정</button></a></div>	
<br>	

	<form id="fmField" name="fmField" action="managerLogin.do" method="POST">
		<table border="1" align="center" class="table text-center">
			<tr>
				<td colspan="2" align="center"><img src="${pageContext.request.contextPath}/image/manager.png"/></td>
			</tr>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="managerId"></td>
			</tr>
			<tr>
				<td>PW :</td>
				<td><input type="password" name="managerPassword"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" value="관리자로 로그인" onclick="checkForm()"/>&nbsp; <input type="reset" value="취소" /></td>
			</tr>
		</table>
	</form>
	<div align="right">
		<br>
		<a href="candidateMain.do"><button class="btn btn-primary m-3 p-3">돌아가기</button></a><br> <br>
	</div>
</body>
</html>