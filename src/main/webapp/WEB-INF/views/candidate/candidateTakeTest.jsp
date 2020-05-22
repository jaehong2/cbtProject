<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var score = ${takeExamId.score};
		
		if(score != 9999){
			$("[id ='btn']").html('응시결과 확인');
			$("[id ='takeExamForm']").attr('action','${pageContext.request.contextPath }/candidateTestResult.do');
			alert('응시 완료한 시험입니다.');
		}
		$("[id ='btn']").click(function(){
			
			takeExamForm.submit();
			
		});
		
	})
</script>
</head>
<body>
	<form id="takeExamForm" name="takeExamForm" action="${pageContext.request.contextPath }/candidateTakeExam.do" method="post">
		<input type="text" id="eId" name="examId" value="${detailExam.examId }" hidden="ture">
		<input type="text" id="tId" name="takeExamId" value="${takeExamId.takeExamId }" hidden="ture">
	</form>

	<header id="header"></header>
	<h3>시험 상세 보기</h3>
	<div class="container">
	<input type = "hidden" name = "no" value = "${ dto.no }">
	<table border = "1" class="table text-center" border="1">

		<tr>
			<th width="150px">시험이름</th>
			<td id="mainExamName">${detailExam.examName}</td>
		</tr>
		
<c:if test="${detailExam.disclosureStatus == '2'}">
		<td colspan="2"><br><br><br><h2> 본 시험은 비공개 시험입니다. <br><br> 응시대상자이신지 확인하여 주세요 </h2> <br><br><br></td>
</c:if>

<c:if test="${detailExam.disclosureStatus == '1'}">
		<tr>
			<th>시험시간</th>
			<td>${detailExam.examStartTime} ~ ${detailExam.examEndTime}</td>
		</tr>
		<tr>
			<th>문항수</th>
			<td>${detailExam.questionQuantity}</td>
		</tr>
		<tr>
			<th>응시가능 횟수</th>
			<td>${detailExam.numberOfTimes}</td>
		</tr>
		<tr>
			<th>합격 점수</th>
			<td>${detailExam.passingScore}</td>
		</tr>
		<tr>
			<th>응시가능 인원</th>
			<td>${detailExam.applicants}</td>
		</tr>
		<tr>
			<th>시험상태</th>
			<c:if test="${detailExam.examStatus == 'D1'}">
				<td>시험전</td>
			</c:if>
			<c:if test="${detailExam.examStatus == 'D2'}">
				<td>시험중</td>
			</c:if>
			<c:if test="${detailExam.examStatus == 'D3'}">
				<td>시험완료</td>
			</c:if>
		</tr>
		<tr>
			<th>시험설명(간략)</th>
			<td>${detailExam.examDescriptionSimple}</td>
		</tr>
		<tr>
			<th>시험설명(상세)</th>
			<td>${detailExam.examDescriptionDetail}</td>
		</tr>
</c:if>
	</table>
	<br>
	<button type="button" class="btn btn-primary m-3 p-3" id="btn" value="${detailExam.examId }">응시하기</button>
	<input type = "button" onclick = "location.href = '${pageContext.request.contextPath }/candidateScheduleCheck.do'" value = "돌아가기">
	</div>
</body>
</html>