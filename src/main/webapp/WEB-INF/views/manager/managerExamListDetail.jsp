<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#I1SetExam").click(function() {
			console.log("send");
			location.href="${pageContext.request.contextPath }/setQuestionList.do/${selectedExam.examId}"
		});
		
		$("#I2SetExam").click(function() {
			console.log("send");
			location.href="${pageContext.request.contextPath }/setQuestionList.do/${selectedExam.examId}"
		});
	});
</script>

	<!-- 2019.07.11 성재민 -->
	<!-- 시험 정보 상세 보기 수정 -->

	<h4 class="mx-auto pb-2">개별 시험 의뢰 목록 (기업화면)</h4>
	<input type = "hidden" name = "no" value = "${ dto.no }">
	<table align="center" class="table">
		<tr>
			<th><label>의뢰기업</label></th>
			<td>${selectedExam.companyId}</td>
		</tr>
		<tr>
			<th><label>시험이름</label></th>
			<td>${selectedExam.examName}</td>
		</tr>
		<tr>
			<th><label>시험시간</label></th>
			<td>${selectedExam.examStartTime} ~ ${selectedExam.examEndTime}</td>
		</tr>
		<tr>
			<th><label>문항수</label></th>
			<td>${selectedExam.questionQuantity}</td>
		</tr>
		<tr>
			<th><label>응시가능 횟수</label></th>
			<td>${selectedExam.numberOfTimes}</td>
		</tr>
		<tr>
			<th><label>합격 점수</label></th>
			<td>${selectedExam.passingScore}</td>
		</tr>
		<tr>
			<th><label>응시가능 인원</label></th>
			<td>${selectedExam.applicants}</td>
		</tr>
		<tr>
			<th><label>공개여부</label></th>
			<c:if test="${selectedExam.disclosureStatus == 'O1'}">
				<td>공개</td>
			</c:if>
			<c:if test="${selectedExam.disclosureStatus == 'O2'}">
				<td>비공개</td>
			</c:if>
		</tr>
		<tr>
			<th><label>시험상태</label></th>
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
			<th><label>출제상태</label></th>
			<c:if test="${selectedExam.setExamStatus == 'I1'}">
				<td>출제중 <input type="button" id="I1SetExam" value="출제하기"></td>
			</c:if>
			<c:if test="${selectedExam.setExamStatus == 'I2'}">
				<td>
					출제완료 <!-- <input type="button" id="I2SetExam" value="출제하기"> -->
					[<a href="<c:url value='/managerExamQuestionExcelDown.do/${examId}' />">엑셀 다운</a>]
				</td>
			</c:if>
			<c:if test="${selectedExam.setExamStatus == 'I3'}">
				<td>
					시험전
					[<a href="<c:url value='/managerExamQuestionExcelDown.do/${examId}' />">엑셀 다운</a>]
				</td>
			</c:if>
			<c:if test="${selectedExam.setExamStatus == 'I4'}">
				<td>
					시험완료
					[<a href="<c:url value='/managerExamQuestionExcelDown.do/${examId}' />">엑셀 다운</a>]
				</td>
			</c:if>
		</tr>
		<tr>
			<th><label>시험설명(간략)</label></th>
			<td>${selectedExam.examDescriptionSimple}</td>
		</tr>
		<tr>
			<th><label>시험설명(상세)</label></th>
			<td>${selectedExam.examDescriptionDetail}</td>
		</tr>
	</table>
	<br>
	<button onclick = "location.href = '${pageContext.request.contextPath }/'" class="btn btn-primary m-3 p-3" >통계보기</button>
	<input type = "button" class="btn btn-warning" onclick = "location.href = '${pageContext.request.contextPath }/managerExamList.do'" value = "돌아가기">
	<button type = "button" class="btn btn-primary" onclick = "location.href = '${pageContext.request.contextPath}/managerExamUpdate.do/${examId }'">수정하기</button>
