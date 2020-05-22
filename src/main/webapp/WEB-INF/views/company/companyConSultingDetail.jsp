<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datetimepicker-master/jquery.datetimepicker.css">
<script src="${pageContext.request.contextPath}/js/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		jQuery.datetimepicker.setLocale('kr'); // 한국어
		
		jQuery('#consultingDesiredDate').datetimepicker({
			format:'Y/m/d H:i', 'minDate' : new Date(), //오늘날짜가 minimum
			allowTimes:[
				'9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
				'12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
				'16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
				'20:00', '20:30', '21:00'
			],
			onShow:function( ct ){
				this.setOptions({
					maxDate:jQuery('#consultingDesiredDate').val()?jQuery('#consultingDesiredDate').val():false
				})
			},
			timepicker:true
		});
		
		$("#deleteBtn").click(function() {
			if (confirm("삭제 하시겠습니까?")){ 
				// 삭제하는 페이지로 Go Go 
				location.href = '${pageContext.request.contextPath }/companyConSultingDelete.do/${consulting.consultingId}';
			} else { 
				alert("삭제 취소 되었습니다."); 
				return; 
			} 
		});
	});
</script>

	<h4 class="mx-auto pb-2">상담 세부 항목</h4>
	<table class="table text-center">
		<tr>
			<th><label>상담희망일</label></th>
			<td style="text-align: left;"><input type="text" name="consultingDesiredDate" id="consultingDesiredDate" class="form-control" value="${consulting.consultingDesiredDate}" readonly></td>
		</tr>
		<tr>
			<th><label>제목</label></th>
			<td><input type="text" name="consultingTitle" id="consultingTitle" 
					class="form-control" value="${consulting.consultingTitle}" style="width: 100%;" readonly="readonly"></td>
		</tr>
		<tr>
			<th><label>상담내용</label></th>
			<td><textarea name="consultingContents" id="consultingContents" cols="80" rows="8" class="form-control" readonly>${consulting.consultingContents}</textarea><td>
		</tr>
		<tr>
			<!-- 2019.07.10 성재민 -->
			<!-- 상담일 값이 있으면 해당 값을 없으면 미정이라고 표시 -->
			<th><label>상담일</label></th>
			<c:if test="${not empty consulting.consultingDate }">
				<td><input type="datetime-local" name="consultingDate" id="consultingDate" readonly="readonly" class="form-control" value="${consulting.consultingDate}"></td>
			</c:if>
			<c:if test="${empty consulting.consultingDate }">
				<td>상담일이 지정되지 않았습니다.</td>
			</c:if>
		</tr>
	</table>
	<br>

	<c:if test="${consulting.consultingState == 'C1'}">
		<input type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath }/companyConSultingUpdate.do/${consulting.consultingId}'" value="수정하기">
	</c:if>
	<input id="deleteBtn" type="button" class="btn btn-warning" value="삭제하기">
	<input type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath }/companyConSultingList.do'" value="목록으로">
