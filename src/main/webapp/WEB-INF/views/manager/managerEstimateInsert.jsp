<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!-- 지우지마세요!!!!! -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script>
	//의뢰서
	$(document).ready(function() {
		
		
		
		//카테고리ID 값을 채운다
		$.ajax({
			type:"GET",
			dataType: "json",
			url:"${pageContext.request.contextPath }/getCateoryNameList.do",
			success : function(data) {
				// db에서 읽어온 값으로 카테고리 ID 설정
				for(var i = 0; i < data.length; ++i){
					if(i==0){
						var optionMain = $("<option value=" + data[i].categoryId + " selected= \"selected\" >" + data[i].categoryName + "</option>");
						$("#categoryName").append(optionMain);
					}
					else{
						var optionMain = $("<option value=" + data[i].categoryId + ">" + data[i].categoryName + "</option>");
						$("#categoryName").append(optionMain);
						// 메인 카테고리 값을 전달받은 값으로 지정하고 체인지 트리거를 발동하여 
						// 중분류 의 셀렉트 옵션 값을 채운다.	
					}
				}
			}, error : function() {
				alert('에러발생');
			}
		});
		//미리생길 이벤트를 건다.
		$('#tbodyCompany').on('click','.companyNameVal', function (){
			
			$('#companyId').val($(this).parent().parent().find('td').eq(0).text());
			$('#companyName').val($(this).parent().parent().find('td').eq(1).text());
			$('#exampleModal').modal('hide');
		});
		
		
		$('#btnCompanyFind').on('click', function (e) {

			$('#exampleModal').modal('show');
			$.ajax({
				type:"GET",
				dataType: "json",
				url:"${pageContext.request.contextPath }/getcompanyNameList.do",
				success : function(data) {
					console.log(data);
					$('#tbodyCompany').empty();
					// company ID, Name 출력
					for(var i = 0; i < data.length; ++i){
							
							var tag = "<tr><td onclick='companyNameInsert()'>" + data[i].companyId + "</td> <td>" 
									+ data[i].companyName + "</td>"
									+ "<td><button class='companyNameVal'>선택</button></td></tr>";
							$('#tbodyCompany').append(tag); //tbody밑에 값채워줌
						}
						
					} , error : function() {
					alert('에러발생');
				}
			});
		});
		
		
		
		//확인버튼 눌렀을때 처리 로직
		$("#submitBtn").click(function() {
			
			///////////////////////예외처리부분////////////////////
			var form = document.form;
			
			/* var estimateId = $("#estimateId").val(); //estimateId의 값
			if(estimateId.length == 0){	//  estimateId 예외처리부분
				alert("Id를 입력하세요");
				form.estimateId.focus(); 
				return false;
			} */
			
			 var companyId = $("#companyId").val(); //companyId의 값
			 if(companyId.length == 0){	//  companyId 예외처리부분
					alert("기업Id를 입력하세요");
					form.companyId.focus(); 
					return false;
				}
			
			
			var estimateName = $("#estimateName").val(); //estimateName의 값
			if(estimateName.length == 0){	//  estimateName 예외처리부분
				alert("의뢰이름을 입력하세요");
				form.estimateName.focus(); 
				return false;
			}
			 
			 var estimatePrice = $("#estimatePrice").val(); //estimatePrice의 값
			 if(estimatePrice.length == 0){	//  estimatePrice 예외처리부분
					alert("금액를 입력하세요");
					form.estimatePrice.focus(); 
					return false;
				}
			 
			 var applicants = $("#applicants").val(); //applicants의 값
			 if(applicants.length == 0){	//  applicants 예외처리부분
					alert("응시자수를 입력하세요");
					form.applicants.focus(); 
					return false;
				}
			
			 var datepicker = $("#datepicker").val(); //applicants의 값
			 if(datepicker.length == 0){	//  applicants 예외처리부분
					alert("시험일수를 입력하세요");
					form.datepicker.focus(); 
					return false;
				}
			
			
			 var remakrs = $("#remakrs").val(); //remakrs의 값
			 if(remakrs.length == 0){	//  remakrs 예외처리부분
					alert("비고를 입력하세요");
					form.remakrs.focus(); 
					return false;
				}
			 
			///////////////////////예외처리부분////////////////////
		
			
			
			document.form.submit();				// 모든 속성값이 입력이되면 form name을 이용해 managerEstimateInsert.do 이동 
		});
		
		
	});

	</script>


<div align="center">
	<h3 class="mx-auto pb-2">의뢰 등록</h3>
	<form action="managerEstimateInsert.do" method="POST" name="form">
		<table class="table table-striped">
			<%-- <tr>	<td>의뢰ID</td>		<td>	<input type="text" name="estimateId" value="${myEstimateList.estimateId}"
			 id="estimateId"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" readonly></td></tr> --%>
			<tr >
				<td><label>카테고리 </label></td>
				<td><select name="categoryId" id="categoryName"
					class="form-control "></select></td>
			</tr>
			<tr>
				<td><label>기업 ID/ 기업 이름</label></td>
				<td>
					<input type="text" name="companyId" id="companyId"
						class="form-control col-5" style="display: inline" readonly> 
					<input type="text" id="companyName" 
						class="form-control col-5" style="display: inline" readonly>

					<button type="button" class="btn btn-primary" id="btnCompanyFind"
						data-toggle="modal" style="display: inline">기업 찾기</button>				
				</td>
			</tr>
			<tr>
				<td><label>의뢰이름 </label></td>
				<td><input type="text" name="estimateName" id="estimateName"
					class="form-control  "></td>
			</tr>
			<tr>
				<td><label>금액 </label></td>
				<td><input type="text" name="estimatePrice" id="estimatePrice" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"
					class="form-control" placeholder="숫자로 입력"><b> 원</b></td>
			</tr>
			<tr>
				<td><label>의뢰진행상태</label></td>
				<td><my:select items="${B}" name="tradeProgress"
						value="${myEstimateList.tradeProgress}"></my:select></td>
			</tr>
			<tr>
				<td><label>응시대상자</label></td>
				<td><my:select items="${K}" name="candidate"
						value="${myEstimateList.candidate}"></my:select></td>
			</tr>
			<tr>
				<td><label>응시목적 </label></td>
				<td><my:select items="${L}" name="applyPurpose"
						value="${myEstimateList.applyPurpose}"></my:select></td>
			</tr>
			<tr>
				<td><label>응시자 수</label></td>
				<td><input type="text" name="applicants"
					value="${myEstimateList.applicants}" id="applicants" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"
					class="form-control col-11" style="display: inline" placeholder="ex)100명->100 숫자만입력" ></td>
			</tr>
			<tr>
				<td><label>시험분류</label></td>
				<td><my:select items="${M}" name="examClassfication"
						value="${myEstimateList.examClassfication}"></my:select></td>
			</tr>
			<tr>
				<td><label>난이도</label></td>
				<td><my:select items="${G}" name="levelOfDifficulty"
						value="${myEstimateList.levelOfDifficulty}"></my:select></td>
			</tr>
			<tr>
				<td><label>시험일시</label></td>
				<td><input type="text" id="datepicker" name="examDate"
					value="${myEstimateList.examDate}" class="form-control" autocomplete="off" placeholder="클릭하여 날짜를 선택해주세요"></td>
			</tr>
			<tr>
				<td><label>비고</label></td>
				<td><input type="text" name="remarks"
					value="${myEstimateList.remarks}" id="remakrs" class="form-control"></td>
			</tr>
			<%-- <tr>	<td>시험횟수</td>		<td>	<my:select items="${H}" name="examCount" value="${myEstimateList.examCount}"></my:select></td></tr> --%>
			<tr>
				<td><label>시험간격</label></td>
				<td><my:select items="${N}" name="examInterval"
						value="${myEstimateList.examInterval}"></my:select></td>
			</tr>
		</table>
		<button type="button" id="submitBtn" class="btn btn-primary m-3 p-3">등록하기</button>
		<button type="button" onclick="location.href='managerEstimateList.do'"
			class="btn btn-warning m-3 p-3">취소</button>
	</form>
</div>

<script>
			$("#datepicker").datepicker({dateFormat : "yy-mm-dd", "minDate" : new Date()});	  	
			
			//취소버튼 클릭시 실행 함수
			 function windowClose(){
				window.opener.top.location.reload();
				window.close();
			} 
	</script>

<!--기업찾기 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">기업 찾기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-striped">
					<tr>
						<th>기업 ID</th>
						<th>기업 이름</th>
					</tr>
					<tbody id='tbodyCompany'>

					</tbody>
					
				</table>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				<!-- class="btn btn-secondary" -->
			</div>
		</div>
	</div>
</div>