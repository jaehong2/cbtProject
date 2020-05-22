<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
		$("#insertConcultingBtn").click(function() {
			var consultingDesiredDate 	= $("#consultingDesiredDate").val();
			var consultingTitle 		= $("#consultingTitle").val();
			var consultingContents 		= $("#consultingContents").val();
			
			console.log(consultingDesiredDate);
			console.log(consultingTitle);
			console.log(consultingContents);
			
			if(consultingDesiredDate == ''){
				window.alert('상담희망일을 입력해 주세요.');
				$("#consultingDesiredDate").focus();
				return false;
			}
			
			if(consultingTitle == ''){
				window.alert('제목을 입력해 주세요.');
				$("#consultingTitle").focus();
				return false;
			}
			
			if(consultingContents == ''){
				window.alert('상담내용을 입력해 주세요.');
				$("#consultingContents").focus();
				return false;
			}
			
			var inputDate 	= new Date(consultingDesiredDate);
			var curDate		= new Date();
			
			console.log("입력시간");
			console.log(inputDate);
			console.log("현재시간");
			console.log(curDate);
			
			if(inputDate <= curDate){
				alert("상담희망일을 현재 시간보다 이전으로 입력하셨습니다.");	
				$("#consultingDesiredDate").focus();
				return false;
			}

			$("#consultingForm").submit();
		});
		
		$("#backMainBtn").click(function() {
			location.href = "${pageContext.request.contextPath }/companyMain.do";
		});
	});
</script>

<div>
	<form action="companyConsultingInsert.do" name="consultingForm" id="consultingForm" method="post">
		<c:if test="${not empty sessionScope.company }">
			<input type="hidden" name="companyId" value="${company.companyId}">
		</c:if>
		<h4 class="mx-auto pb-2">기업상담신청</h4>
		<table class="table text-center">
			<tr>
				<th><label>상담희망일</label></th>
				<td><input type="text" id="consultingDesiredDate" name="consultingDesiredDate" size="80" class="form-control"
					placeholder="상담을 원하시는 시간을 입력하여 주시면 최대한 반영하도록 하겠습니다." autocomplete="off"></td>
			</tr>
			<tr>
				<th><label>제목</label></th>
				<td><input type="text" id="consultingTitle" name="consultingTitle" class="form-control" placeholder="제목을 입력해 주세요."><td>
			</tr>
			<tr>
				
				<th><label>상담내용</label></th>
				<td><textarea id="consultingContents" name="consultingContents" cols="80" rows="8" class="form-control"
						placeholder="상담하고자 하시는 시험의 종류와 예상인원을 작성하여 주세요. 세부적으로 작성하실수록 상담이 쉬워집니다."></textarea>
				<td>
			</tr>
		</table>
		<input type="button" id="insertConcultingBtn" value="상담신청" class="btn btn-info">
		<input type="button" id="backMainBtn" class="btn btn-warning" value="돌아가기">
	</form>
</div>
