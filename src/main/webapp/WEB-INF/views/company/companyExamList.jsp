<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script>
	// 2019.07.09 성재민 
	// showPopup() 메소드 변수 하나 받게 수정
	// 팝업창이 아니라 다음 화면으로 이동하게 수정
	function showDetail(examId){
		location.href = "companyExamListDetail.do/" + examId;
	}
	function goList(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
	
	function backMainBtn() {
		location.href = "${pageContext.request.contextPath }/companyMain.do";
	}
</script>
<style>
	tr:hover td {background:#ABCDEF !important};  /*마우스 hover 색상  */
</style>
	
	<h4 class="mx-auto pb-2">시험목록확인(기업)</h4>
	<div>
	<form name="searchFrm">
		<input type="hidden"  name="page" value="1"> 
	</form>
	
	<table class="table text-center">
		<thead class="table-secondary">
		<tr >
			<th><label>시험이름</label></th>
			<th><label>시험일시</label></th>
			<th><label>시험상태</label></th>
			<th><label>시험출제상태</label></th>
			<th><label>시험공개여부</label></th>	<!-- 2019.07.23 성재민 항목 추가 -->
		</tr>
		</thead>
		<!-- 2019.07.09 성재민 -->
		<!-- c:forEach 로 값 설정 -->
		<!-- 2019.07.11 성재민 -->
		<!-- 각종 상태값을 코드로 받아서 해당 코드별 문자열로 변환 -->
		<tbody>
		<c:forEach items="${result.companyExamList}" var="exam">
			<tr onclick="showDetail(${exam.examId});">
				<td>${exam.examName}</td>
				<td>${exam.examStartTime} ~<br>${exam.examEndTime}</td>
				<c:if test="${exam.examStatus == 'D1'}">
					<td>시험전</td>
				</c:if>
				<c:if test="${exam.examStatus == 'D2'}">
					<td>시험중</td>
				</c:if>
				<c:if test="${exam.examStatus == 'D3'}">
					<td>시험완료</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I1'}">
					<td>출제중</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I2'}">
					<td>출제완료</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I3'}">
					<td>시험전</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I4'}">
					<td>시험완료</td>
				</c:if>
				<!-- 2019.07.23 성재민 공개/비공개 항목 추가 -->
				<c:if test="${exam.disclosureStatus == 'O1'}">
					<td>공개</td>
				</c:if>
				<c:if test="${exam.disclosureStatus == 'O2'}">
					<td>비공개</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	</div>
	<br>
	<my:paging jsFunc="goList" paging="${result.paging}"/>
	
	<div align="right">
		<input type="button" id="backMainBtn" value="돌아가기" class="btn btn-success" onclick="backMainBtn()">
	</div>
