<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

	<div align="center">
		<h4 class="mx-auto pb-2" >기업 등록 페이지(관리자 화면)</h4>
	<hr />	
	</div>
<form action="${pageContext.request.contextPath }/managerAccountInsert.do" method="post" enctype="application/x-www-form-urlencoded">
<table align="center" border="1">
			<tr>
				<th><label>Company 아이디</label></th><td><input type="text" name="companyId"></td>
			</tr>
			<tr>
				<th><label>비밀번호</label></th><td><input type="password" name="companyPassword"></td>
			</tr>
			<tr>
				<th><label>회사명</label></th><td><input type="text" name="companyName"></td>
			</tr>
			<tr>
				<th><label>사업자번호</label></th><td><input type="text" name="businessNumber"></td>
			</tr>
			<tr>
			<th><label>회사분류</label></th><td>
					<my:select items="${E}" name="companyClassification" value="${result.companyClassification }"></my:select>
					</td>
			</tr>
			<tr>
			<th><label>세부업종</label></th><td>
					<my:select items="${F}" name="companySectors" value="${result.companySectors }"></my:select>
					</td>
			</tr>
			<tr>
				<th><label>결제정보</label></th><td><input type="text" name="companyCredit"></td>
			</tr>
			<tr>
				<th><label>담당자</label></th><td><input type="text" name="companyManager"></td>
			</tr>
			<tr>	
				<th><label>담당자연락처</label></th><td><input type="text" name="companyManagerTelNum"></td>
			</tr>
			</table>
			<br>
			<div align="center">
	<input type="submit" id="submit" class="btn btn-primary" align="middle" value="등록" >&nbsp;&nbsp;&nbsp;
	<input type="reset" id="reset" class="btn btn-danger" onclick="location.href='managerAccountList.do'" value="돌아가기">
	</div>
		</form>

    