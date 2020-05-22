<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<script type="text/javascript">
	/* $(document).ready(function() {
		$("#I1SetExam").click(function() {
			console.log("send");
			location.href="${pageContext.request.contextPath }/setQuestionList.do/${selectedExam.examId}"
		});
		
		$("#I2SetExam").click(function() {
			console.log("send");
			location.href="${pageContext.request.contextPath }/setQuestionList.do/${selectedExam.examId}"
		});
	}); */
	
	jQuery.datetimepicker.setLocale('kr'); // 한국어
	   
	   
	   jQuery(function(){
	      
	      /* jQuery('#startTime').datetimepicker({
	          format:'Y.m.d H:i',
	          allowTimes:[
	           '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
	            '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
	           '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
	           '20:00', '20:30', '21:00'
	          ]
	          ,
	       timepicker:false
	      }); */
	      
	      
	      jQuery(function(){
	          jQuery('#date_timepicker_start').datetimepicker({
	           format:'Y/m/d H:i',
	           allowTimes:[
	              '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
	               '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
	              '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
	              '20:00', '20:30', '21:00'
	             ],
	           onShow:function( ct ){
	            this.setOptions({
	             maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
	            })
	           },
	           timepicker:true
	          });
	          jQuery('#date_timepicker_end').datetimepicker({
	           format:'Y/m/d H:i',
	           allowTimes:[
	              '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
	               '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
	              '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
	              '20:00', '20:30', '21:00'
	             ],
	           onShow:function( ct ){
	            this.setOptions({
	             minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false
	            })
	           },
	           timepicker:true
	          });
	         });
	      
	      
	      });
	   
</script>


	<!-- 2019.07.11 성재민 -->
	<!-- 시험 정보 상세 보기 수정 -->
	<h4 class="mx-auto pb-2">개별 시험 의뢰 목록 (기업화면)</h4>
	<form action="${pageContext.request.contextPath }/managerExamUpdate.do" method="post">
	<input type = "hidden" name = "examId" value = "${selectedExam.examId}">
	<input type = "hidden" name = "estimateId" value = "${selectedExam.estimateId}">
	<table border = "1" align="center">
		<tr>
			<th><label>의뢰ID</label></th>
			<td><input type="text" name="companyId" class="form-control" value="${selectedExam.companyId}" id = "companyId" ></td>
		</tr>
		<tr>
			<th><label>시험이름</label></th>
			<td><input type="text" name="estimateName" class="form-control" value="${selectedExam.examName}" id="estimateName"></td>
		</tr>
		<tr>
			<th><label>시험시작시간</label></th>
			<td><input type="text" name="examStartTime" class="form-control" value="${selectedExam.examStartTime}" id="examStartTime"></td>
		</tr>
		<tr>
			<th><label>시험종료시간</label></th>
			<td><input type="text" name="examEndTime" class="form-control" value="${selectedExam.examEndTime}" id="examEndTime"></td>
		</tr>
		<tr>
			<th><label>문항수</label></th>
			<td><input type="text" name="questionQuantity" class="form-control" value="${selectedExam.questionQuantity}" id="questionQuantity"></td>
		</tr>
		<tr>
			<th><label>응시가능 횟수</label></th>
			<td><input type="text" name="numberOfTimes" class="form-control" value="${selectedExam.numberOfTimes}" id="numberOfTimes"></td>
		</tr>
		<tr>
			<th><label>합격 점수</label></th>
			<td><input type="text" name="passingScore" class="form-control" value="${selectedExam.passingScore}" id="passingScore"></td>
		</tr>
		<tr>
			<th><label>응시가능 인원</label></th>
			<td><input type="text" name="applicants" class="form-control" value="${selectedExam.applicants}" id="applicants"></td>
		</tr>
		<tr>
			<th><label>공개여부</label></th>
			<td><my:select items="${O}" name="disclosureStatus" value="${selectedExam.disclosureStatus }"></my:select></td>
		</tr>
		<tr>
			<th><label>시험상태</label></th>
			<td><my:select items="${D}" name="examStatus" value="${selectedExam.examStatus }"></my:select></td>
		</tr>
		<tr>
			<th><label>출제상태</label></th>
			<td><my:select items="${I}" name="setExamStatus" value="${selectedExam.setExamStatus }"></my:select></td>
		</tr>
		<tr>
			<th><label>시험설명(간략)</label></th>
			<td><input type="text" name="examDescriptionSimple" class="form-control" value="${selectedExam.examDescriptionSimple}" id="examDescriptionSimple"></td>
		</tr>
		<tr>
			<th><label>시험설명(상세)</label></th>
			<td><input type="text" name="examDescriptionDetail" class="form-control" value="${selectedExam.examDescriptionDetail}" id="examDescriptionDetail"></td>
		</tr>
	</table>
	<br>
	<input type= "submit" value="수정하기" class="btn btn-primary m-3 p-3">
	<input type = "button" class="btn btn-primary m-3 p-3" onclick = "location.href = '${pageContext.request.contextPath }/managerExamList.do'" value = "돌아가기">
	</form>







