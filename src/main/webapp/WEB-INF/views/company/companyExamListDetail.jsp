<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<!-- 2019.07.11 성재민 -->
	<!-- 시험 정보 상세 보기 수정 -->
	<header id="header"></header>
	<h4 class="mx-auto pb-2">시험 정보 상세 보기</h4>
	<br>
	<input type = "hidden" name = "no" value = "${ dto.no }">
	<table class="table text-center">
		<tr>
			<th width="150px">시험이름</th>
			<td>${selectedExam.examName}</td>
		</tr>
		<tr>
			<th>시험시간</th>
			<td>${selectedExam.examStartTime} ~ ${selectedExam.examEndTime}</td>
		</tr>
		<tr>
			<th>문항수</th>
			<td>${selectedExam.questionQuantity}</td>
		</tr>
		<tr>
			<th>응시가능 횟수</th>
			<td>${selectedExam.numberOfTimes}</td>
		</tr>
		<tr>
			<th>합격 점수</th>
			<td>${selectedExam.passingScore}</td>
		</tr>
		<tr>
			<th>응시가능 인원</th>
			<td>${selectedExam.applicants}</td>
		</tr>
		<tr>
			<th>공개여부</th>
			<c:if test="${selectedExam.disclosureStatus == 'O1'}">
				<td>공개</td>
			</c:if>
			<c:if test="${selectedExam.disclosureStatus == 'O2'}">
				<td>비공개</td>
			</c:if>
		</tr>
		<tr>
			<th>시험상태</th>
			<c:if test="${selectedExam.examStatus == 'D1'}">
				<td>시험전</td>
			</c:if>
			<c:if test="${selectedExam.examStatus == 'D2'}">
				<td>시험중</td>
			</c:if>
			<c:if test="${selectedExam.examStatus == 'D3'}">
				<td>시험완료</td>
			</c:if>
		</tr>
		<tr>
			<th>출제상태</th>
			<c:if test="${selectedExam.setExamStatus == 'I1'}">
				<td>출제전</td>
			</c:if>
			<c:if test="${selectedExam.setExamStatus == 'I2'}">
				<td>출제중</td>
			</c:if>
			<c:if test="${selectedExam.setExamStatus == 'I3'}">
				<td>출제완료</td>
			</c:if>
		</tr>
		<tr>
			<th>시험설명(간략)</th>
			<td>${selectedExam.examDescriptionSimple}</td>
		</tr>
		<tr>
			<th>시험설명(상세)</th>
			<td>${selectedExam.examDescriptionDetail}</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<h4 class="mx-auto pb-2">응시자별 현황</h4>
	<div class="mx-auto pb-2" style="font-size: 15px; text-align : right;">${fn:length(selectedExamTaker)} / ${selectedExam.applicants}</div>
	<br>
	<table class="table text-center">
		<tr>
			<th>No.</th>
			<th>I D</th>
			<th>Name</th>
			<th>Date of examination</th>
			<th>Score</th>
			<th>Result</th>
		</tr>
		<c:forEach items="${selectedExamTaker}" var="exam" varStatus="status">
		<tr>
			<td id="count" value="${status.count}">${status.count} .</td>
			<td>${exam.takerId}</td>
			<td>${exam.takerName}</td>
			<td>${exam.takeExamDate}</td>
			<td>
				<c:if test="${exam.score eq 9999}"><font color="blue">미 응시자</font></c:if>
				<c:if test="${exam.score ne 9999}"><font color="tomato">${exam.score}</font></c:if>
			</td>
			<td>
				<c:if test="${exam.score eq 9999}"><font color="blue">미 응시자</font></c:if>
				<c:if test="${exam.score ne 9999}">
					<c:if test="${selectedExam.passingScore le exam.score}"><font color="blue">합격</font></c:if>
					<c:if test="${selectedExam.passingScore gt exam.score}"><font color="tomato">불합격</font></c:if>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div align="right">
		<button onclick = "location.href = '${pageContext.request.contextPath }/companyExamListDetailGraph.do/${selectedExam.examId}'" class="btn btn-warning">통계보기</button>
		<input type = "button" onclick = "location.href = '${pageContext.request.contextPath }/companyExamList.do'" value = "돌아가기" class="btn btn-info">
	</div>
</body>
</html>