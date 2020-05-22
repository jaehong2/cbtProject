<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">	
	function goList(p){
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
<style>
	tr:hover td {background:#ABCDEF !important};  /*마우스 hover 색상  */
</style>

	<h4 class="mx-auto pb-2">상담목록</h4>

	<form name="searchFrm">
		<input type = "hidden" name="page" value="1">
	</form>
	<table class="table text-center">
		<tr>
			<th>제목</th>
			<th>상담희망일</th>
			<th>상담일</th>
			<th>상담상태</th>
		</tr>
		<c:forEach items="${result.consultingList}" var="consulting">
			<tr onclick="location.href='companyConSultingDetail.do/${consulting.consultingId}'">
				<td>${consulting.consultingTitle}</td>
				<!-- 2019.07.10 성재민 -->
				<!-- 상담 신청일이 저장되는 td 를 식별하기 위새 id 추가(식별값으로 consultingId 사용) -->
				<td>${consulting.consultingDesiredDate}</td>
				<td>
					<c:if test="${not empty consulting.consultingDate }">
						${consulting.consultingDate }
					</c:if>
					<c:if test="${empty consulting.consultingDate }">
						상담일이 지정되지 않았습니다.
					</c:if>
				</td>
				<td>
					<c:if test="${consulting.consultingState == 'C1'}">
						상담전
					</c:if>
					<c:if test="${consulting.consultingState == 'C2'}">
						상담완료
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div align="center"><my:paging jsFunc="goList" paging="${result.paging }"/></div>
	
	<div align="right">
		<button onclick="location.href='companyMain.do'" class="btn btn-primary" >돌아가기</button>
	</div>