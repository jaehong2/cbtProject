<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datetimepicker-master/jquery.datetimepicker.css">
<script src="${pageContext.request.contextPath}/js/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>
<style>
	input[type="text"],textarea,select{width:80%} 
</style>
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
		
		jQuery('#consultingDate').datetimepicker({
			format:'Y/m/d H:i', 'minDate' : new Date(), //오늘날짜가 minimum
			allowTimes:[
				'9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
				'12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
				'16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
				'20:00', '20:30', '21:00'
			],
			onShow:function( ct ){
				this.setOptions({
					maxDate:jQuery('#consultingDate').val()?jQuery('#consultingDate').val():false
				})
			},
			timepicker:true
		});
	});
</script>
	<h4 class="mx-auto pb-2">개별 시험 상담 목록 (관리자화면)</h4>
	<form action="${pageContext.request.contextPath }/managerConsultingListDetail.do" method="post">
	<input type="hidden" name="consultingId" value="${result.consultingId }">
	<table border = "1" class="table">
		<tr>
			<th><label>상담 ID</label> </th><td>${result.consultingId }</td>
		</tr>
		<tr>
			<th><label>상담 기업</label></th><td>${result.companyId }</td>
		</tr>
		<tr>
			<th><label>제목</label></th><td><input type="text" name="consultingTitle" class="form-control" size="80" value="${result.consultingTitle }"></td>
		<tr>
			<th><label>상담내용</label></th><td><textarea name="consultingContents" class="form-control" id="consultingContents" cols="80" rows="8">${result.consultingContents}</textarea></td>
		</tr>
		<tr>
			<th><label>상담희망일</label></th>
			<td><input type="text" name="consultingDesiredDate" class="form-control" id="consultingDesiredDate" autocomplete="off" value="${result.consultingDesiredDate}"></td>
		</tr>
		<tr>
			<th><label>상담일</label></th>
			<td><input type="text" name="consultingDate" class="form-control" id="consultingDate" autocomplete="off" value="${result.consultingDate}"></td>
		</tr>
		<tr>
		<tr>
			<th><label>비고</label></th><td><textarea name="consultingRemarks" class="form-control" id="consultingRemarks" cols="80" rows="4">${result.consultingRemarks }</textarea></td>
		</tr>
		<tr>
			<th><label>상담상태</label></th><td><my:select items="${C}" name="consultingState" value="${result.consultingState }"></my:select></td>
		</tr>
	</table>
	
		<input type="submit" value="수정하기" class="btn btn-primary m-3 p-3">
		<input type="button" class="btn btn-warning m-3 p-3" onclick="location.href='${pageContext.request.contextPath }/managerConsultingList.do'" value="돌아가기">
</form>
