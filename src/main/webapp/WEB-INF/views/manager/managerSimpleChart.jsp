<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<script>
	$(document).ready(function() {	
		$("#examResult").click(function() {
			$("#companySelect option").remove();
			$("#examSelect option").remove();

			var optionCompany = $("<option value=-1>" + "-기업을 선택하세요-" + "</option>");
			$("#companySelect").append(optionCompany);
			
			var optionExam = $("<option value=-1>" + "-시험을 선택하세요-" + "</option>");
			$("#examSelect").append(optionExam);
			
			$.ajax({
				type: "GET",
				url : "${pageContext.request.contextPath }/getcompanyNameList.do",
				success: function(data) {
					if(data.length <= 0){
						return;
					}
					
					for(var i = 0; i < data.length; ++i){
						var optionMain = $("<option value=" + data[i].companyId + ">" + data[i].companyName + "</option>");
						jQuery('#companySelect').show();  
						jQuery('#examSelect').show();  
						$("#companySelect").append(optionMain);
					}
				}
			});
		});
		
		$("#surveyResult").click(function() {
			location.href='${pageContext.request.contextPath}/managerSurveyDetailGraph.do';
		});
		
		$("#companySelect").change(function() {
			$("#examSelect option").remove();
			var optionBasic = $("<option value=-1>" + "-시험을 선택하세요-" + "</option>");
			$("#examSelect").append(optionBasic);
			
			var selectedIdx = $("#companySelect option:selected").val();
			console.log(selectedIdx);
			
			$.ajax({
				type: "POST",
				url:"${pageContext.request.contextPath}/getCompanyExamList.do/" + selectedIdx,
				success : function(data) {
					for(var i = 0; i < data.length; ++i){
						var optionExam = $("<option value=" + data[i].examId + ">" + data[i].examName + "</option>");
						$("#examSelect").append(optionMain);
					}
				}, error : function() {
					alert('에러발생');
				}
			});
		});
	});
</script>

<h4 align ="center"class="alert alert-primary p-1 m-1">통계관리</h4>
<div align="center">
<!-- <button type="button" id="examResult" class="btn btn-large btn-primary" style="font-size:2em">시험결과 보기</button> -->
<button type="button" id="surveyResult" class="btn btn-large btn-warning" style="font-size:2em">설문결과 보기</button>
</div>

<div>
	<br>
	<select name="companySelect" id="companySelect" class="form-control" style="display: none;">
		<option value="-1">-기업을 선택하세요-</option>
	</select>
	
	<select name="examSelect" id="examSelect" class="form-control" style="display: none;">
		<option value="-1">-시험을 선택하세요-</option>
	</select>
</div>