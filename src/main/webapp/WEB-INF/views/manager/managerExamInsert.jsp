<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
   
   
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datetimepicker-master/jquery.datetimepicker.css">
	<style>
		input[type="text"], select, textarea{width:70%}
	</style>
<script src="${pageContext.request.contextPath}/js/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>
<script>
$(document).ready(function() {
	var examName = "${estimate.estimateName }";
	$("#examName").attr("value",examName);
})

   jQuery.datetimepicker.setLocale('kr'); // 한국어
   
   
   jQuery(function(){
      
      jQuery(function(){
          jQuery('#date_timepicker_start').datetimepicker({
           format:'Y/m/d H:i',
           'minDate' : new Date(), //오늘날짜가 minimum
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
           "minDate" : new Date(), //오늘날짜가 minimum
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
   	   var estimateId = "${estimate.estimateId }";
	   $("#submit").click(function(){ 
			$.ajax({
				url:"${pageContext.request.contextPath}/updatesTradeProgressExchange2.do", //시험을등록하면   출제전-> 출제중으로 상태변경
				data: { estimateId:  estimateId},
				success : function() {
					alert('등록했습니다.');
					//location.reload();
				}, error : function() {
					alert('에러발생');
				}
			});
			document.form.submit();
		});
</script>

	<h4 class="mx-auto pb-2">관리자 시험 등록 페이지</h4>

  <div class="row" style="padding-left:50px"  >
  <div class="span2"></div>
    <div class="span4">
    	<h5>의뢰 내용</h5>
      	<table style="padding: 5px 0 5px 0;" align = "center" class="table">
			<tr>
				<th>기업Id</th>
				<td>${estimate.companyId }</td>
			</tr>
			<tr>
				<th>시험이름</th>
				<td>${estimate.estimateName }</td>
			</tr>
			<tr>
				<th>시험일시</th>
				<td>${estimate.examDate }</td>
			</tr>
			<tr>
				<th>카테고리 이름</th>
				<td>${estimate.categoryName }</td>
			</tr>
			<tr>
				<th>응시자 수</th>
				<td>${estimate.applicants }</td>
			</tr>
			<tr>
				<th>응시 대상자</th>
				<td>${estimate.candidateName }</td>
			</tr>
			<tr>
				<th>응시 목적</th>
				<td>${estimate.applyPurposeName }</td>
			</tr>
			
		</table>
    </div>
    <div class="span4">
    	<h5>시험 등록</h5>
      	<form action="${pageContext.request.contextPath }/managerExamInsert.do/${estimate.estimateId}" method="post" >
		<input  id="examName" name="examName" hidden="true">
		<input type="hidden" id="estimateId"  name="estimateId" value="${estimate.estimateId }">
		<table  style="width:100%">
			<tr>
				<th><label>기업Id</label></th>
				<td><input type="text" id="companyId" name="companyId" class="form-control" value="${estimate.companyId }" readonly></td>
			</tr>
			<tr>
				<th><label>시험이름</label></th>
				<td><input type="text" id="estimateName" name="estimateName" class="form-control" value="${estimate.estimateName }" readonly></td>
			</tr>
			<tr>
				<th><label>시작일</label></th>
				<td><input type="text" id="date_timepicker_start" class="form-control"  name="examStartTime" value="${estimate.examDate}"></td>
			</tr>
			<tr>
				<th><label>종료일</label></th>
				<td><input type="text" id="date_timepicker_end"  class="form-control"  name="examEndTime" value="${estimate.examDate}"></td>
			</tr>
			<tr>
				<th><label>응시자 수</label></th>
				<td><input type="text" name="applicants" class="form-control"  id="applicants" value="${estimate.applicants }"></td>
			</tr>
			
			
			<%-- <tr>
				<th>시험상태</th><td>
				<my:select items="${D}" name="examStatus" value="${result.examStatus }"></my:select></td>
			</tr>
			<tr>
				<th>출제상태</th><td>
				<my:select items="${I}" name="setExamStatus" value="${result.setExamStatus }"></my:select></td>
			</tr> --%>
			<tr>
				<th><label>문항수</label></th>
				<td><input type="text" class="form-control"   name="questionQuantity"></td>
			</tr>
			<tr>
				<th><label>합격 점수</label></th>
				<td><input type="text" class="form-control"  name="passingScore"></td>
			</tr>
			<tr>
				<th><label>공개여부</label></th><td>
				<my:select items="${O}" name="disclosureStatus" value="${result.disclosureStatus }"></my:select></td>
			</tr>
			<tr>
				<th><label>시험설명(간략)</label></th>
				<td><textarea name="examDescriptionSimple" class="form-control"  cols="50" rows="5"></textarea></td>
			</tr>
			<tr>
				<th><label>시험설명(상세)</label></th>
				<td><textarea name="examDescriptionDetail" class="form-control"  cols="50" rows="5"></textarea></td>
			</tr>
		</table>
		<hr />
		<input type="submit" value="시험등록" class="btn btn-primary m-3 p-3">
		<input type="reset" id="reset" class="btn btn-warning m-3 p-3" onclick="location.href='${pageContext.request.contextPath }/managerEstimateList.do'" value="돌아가기">	
	</form>
    </div>
    <div class="span2"></div>
  </div>




