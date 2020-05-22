<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<style type="text/css">
   .trexam {cursor: pointer; }
    tr.trexam:hover { background-color: lightblue; } 
   thead {background-color: lightgrey}
</style>
<script>
	// 2019.07.09 성재민 
	// showPopup() 메소드 변수 하나 받게 수정
	// 팝업창이 아니라 다음 화면으로 이동하게 수정
	function showDetail(examId){
		location.href = "managerExamListDetail.do/" + examId;
	}
	
	function goList(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>

	<h3>시험목록확인(기업)</h3>

	<div>
		<form name="searchFrm">
			정렬기준 <input type="hidden" id="page" name="page" value="1"> 
			<select	name="sort">
				<option value="COMPANY.COMPANY_ID">회사명
				<option value="EXAM_STATUS">시험상태
				<option value="EXAM_START_TIME">시험일
			</select> &nbsp;&nbsp; 검색조건
			<my:examListSelect items="${examMap }" />
			&nbsp;&nbsp; <input type="text" name="searchKeyword" value="${ExamVO.searchKeyword }">
			&nbsp;&nbsp; 시험상태<select	name="examStatus">
				<option value="D1">시험전
				<option value="D2">시험중
				<option value="D3">시험종료
			</select>&nbsp;&nbsp;
			<button class="btn btn-primary">검색</button>
		</form>
		
		<script>
		searchFrm.sort.value="${ExamVO.sort}"==""?searchFrm.sort.options[0].value
							:"${ExamVO.sort}";
		searchFrm.searchExam.value="${ExamVO.searchExam}"==""
									?searchFrm.searchExam.options[0].value
									:"${ExamVO.searchExam}";
	</script>
	
	<br>
	<table border="1" align="center" class="table">
		<thead>
		<tr>
			<th><label>의뢰기업</label></th>
			<th><label>시험이름</label></th>
			<th><label>시험일시</label></th>
			<th><label>시험상태</label></th>
			<th><label>시험출제상태</label></th>
		</tr>
		</thead>
		<!-- 2019.07.09 성재민 -->
		<!-- c:forEach 로 값 설정 -->
		<!-- 2019.07.11 성재민 -->
		<!-- 각종 상태값을 코드로 받아서 해당 코드별 문자열로 변환 -->
		<tbody>
		<c:forEach items="${result.examList}" var="exam">
			<tr  class="trexam">
				<td onclick="showDetail(${exam.examId});">${exam.companyId}</td>
				<td onclick="showDetail(${exam.examId});">${exam.examName}</td>
				<td onclick="showDetail(${exam.examId});">${exam.examStartTime} ~<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${exam.examEndTime}</td>
				<c:if test="${exam.examStatus == 'D1'}">
					<td onclick="showDetail(${exam.examId});">시험전</td>
				</c:if>
				<c:if test="${exam.examStatus == 'D2'}">
					<td onclick="showDetail(${exam.examId});">시험중</td>
				</c:if>
				<c:if test="${exam.examStatus == 'D3'}">
					<td onclick="showDetail(${exam.examId});">시험완료</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I1'}">
					<td>출제중</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I2'}">
					<td>출제완료 <button onclick="location.href='getQuestionList.do/${exam.examId}'" type="button">문제보기</button></td>
					
				</c:if>
				<c:if test="${exam.setExamStatus == 'I3'}">
					<td>시험전</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I4'}">
					<td>시험완료</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	</div>
	<my:paging jsFunc="goList" paging="${result.paging}"/>
