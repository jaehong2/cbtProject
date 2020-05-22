<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#companyClassification").val("${company.companyClassification}").trigger("change");
			$("#companySectors").val("${company.companySectors}").trigger("change");
		});
	</script>

	<form action="companyUpdate.do" method="post">
		<table border="1" align="center">
			<tr>
				<td>기업ID</td>
				<td><input type="text" name="companyId" id="companyId" class="form-control" value="${company.companyId}"></td>
			</tr>
			<tr>
				<td>기업PW</td>
				<td><input type="password" name="companyPassword" id="companyPassword" class="form-control"></td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input type="password" name="companyPwCheck" id="companyPwCheck" class="form-control" ></td>
			</tr>
			<tr>
				<td>기업명</td>
				<td><input type="text" name="companyName" id="companyName" class="form-control" value="${company.companyName}"></td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td><input type="text" name="businessNumber" id="businessNumber" class="form-control" value="${company.businessNumber}"></td>
			</tr>
			<tr>
				<td>회사분류</td>
				<td>
					<select name="companyClassification" id="companyClassification" class="form-control">
						<option value="-1">-회사분류를 선택하세요-</option>
						<c:forEach items="${companyClassificationList}" var="companyClassificationItem">
							<option value="${companyClassificationItem.detailCd}">${companyClassificationItem.detailNm}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>세부업종</td>
				<td>
					<select name="companySectors" id="companySectors" class="form-control">
						<option value="-1">-세부업종를 선택하세요-</option>
						<c:forEach items="${companySectorsList}" var="companySectorItem">
							<option value="${companySectorItem.detailCd}">${companySectorItem.detailNm}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>주거래 은행</td>
				<td><input type="text" name="companyCredit" id="companyCredit" class="form-control" value="${company.companyCredit}"></td>
			</tr>
			<tr>
				<td>담당자</td>
				<td><input type="text" name="companyManager" id="companyManager" class="form-control" value="${company.companyManager}"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="companyManagerTelNum" id="companyManagerTelNum" class="form-control" value="${company.companyManagerTelNum}"></td>
			</tr>
		</table>
		<div align="right">
			<!-- <button onclick="location.href='companySignUp.do'">가입</button>&nbsp;&nbsp;&nbsp; -->
			<input type="submit" value="수정" class="btn btn-info">
			<input type="reset" value="취소" class="btn btn-warning">
			<button onclick="location.href='companyMain.do'" class="btn btn-primary">돌아가기</button>
		</div>
	</form>
