<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datetimepicker-master/jquery.datetimepicker.css">
<script src="${pageContext.request.contextPath}/js/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>

	<form name="managerConsultingInsert.do" method="post">
		<c:if test="${not empty sessionScope.company }">
			<input type="hidden" name="companyId" value="${company.companyId}">
		</c:if>
		<h4 class="alert alert-primary">관리자 상담 등록 페이지</h4>
		<table style="padding: 5px 0 5px 0;" align = "center">
			<tr>
				<th><label>기업ID</label></th><td><input type="text" name="companyId"></td>
			</tr>
			<tr>
				<th><label>제목</label></th><td><input type="text" name="consultingTitle" class="form-control" size="41"></td>
			</tr>
			<tr>
				<th><label>내용</label></th><td><textarea name="consultingContents" class="form-control" rows="8" cols="40"></textarea></td>
			</tr>
			<tr>
				<th><label>상담희망일</label></th><td><input type="datetime-local" class="form-control" name="consultingDesiredDate" size="80" autocomplete="off"></td>
			</tr>
			<tr>
				<th><label>상담일</label></th><td><input type="datetime-local" class="form-control" name="consultingDate" size="80" autocomplete="off"></td>
			</tr>
			<tr>
				<th><label>비고</label></th><td><textarea name="consultingRemarks" class="form-control" rows="4" cols="40"></textarea></td>
			</tr>
			<tr>
				<th><label>상담상태</label></th><td>
				<my:select items="${C}" name="consultingState" value="${result.consultingState }"></my:select></td>
			</tr>
			
		</table>

		<input type="submit" value="상담신청" class="btn btn-primary m-3 p-3">
		<input type="button" class="btn btn-warning m-3 p-3" onclick="location.href='${pageContext.request.contextPath }/managerConsultingList.do'" value="돌아가기">	
	</form>



