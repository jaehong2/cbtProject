<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<div >
	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>
	<h4 class="mx-auto pb-2">기업시험정보 </h4>
	<table align="center" class="table">
		<tr>
			<th><label>의뢰기업</label></th>
			<td>${selectedExam.companyId}</td>
		</tr>
		<tr>
			<th><label>기업이메일</label></th>
			<td>${selectedExam.companyEmail}</td>
		<tr>
			<th><label>시험이름</label></th>
			<td id ="examName">${selectedExam.examName}</td>
		</tr>
		<tr>
			<th><label>시험시간</label></th>
			<td>${selectedExam.examStartTime} ~ ${selectedExam.examEndTime}</td>
		</tr>
		<tr>
			<th><label>문항수</label></th>
			<td>${selectedExam.questionQuantity}</td>
		</tr>
	</table>
	<h4 class="mx-auto pb-2">문제 정보 </h4>
	<!-- <button id="excelDownBtn" name="excelDownBtn">엑셀 다운</button> -->
	<div align="right">
	<button
		onclick="location.href='${pageContext.request.contextPath }/managerExamList.do'">시험목록으로</button>
	[<a href="<c:url value='/managerExamQuestionExcelDown.do/${examId}' />">엑셀
		다운</a>] [<a
		href="javascript:window.open('<c:url value='/managerExamSendForm.do?examId=${examId}' />','email','width=800,height=600')">이메일전송</a>]
	</div>
</div>
<table id="table_id" class="display">
	<thead>
		<tr>
			<th width="100px">문제</th>
			<th>보기1</th>
			<th>보기2</th>
			<th>보기3</th>
			<th>보기4</th>
			<th>정답</th>
			<th>해설</th>

		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${result}">
			<tr>
				<td>${item.questionContent}</td>
				<td>${item.example1}</td>
				<td>${item.example2}</td>
				<td>${item.example3}</td>
				<td>${item.example4}</td>
				<td>${item.rightAnswer}</td>
				<td>${item.rightCommentary}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
