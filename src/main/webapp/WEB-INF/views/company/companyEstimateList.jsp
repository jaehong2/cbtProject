<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
 
<script>

	var estimate="${result.estimateList}";
	
	//페이징처리
	function goList(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
	
	// 윈도우 function 처리 함수
	function estimateDetail(estimateId){
		var wintype = "toolbar=no,width=1000px,height=700px,top=50,left=250,directories=no,menubar=no,scrollbars=yes";// 윈도우창 띄움
		var winopen = window.open("companyEstimateDetail.do/"+estimateId,"windowopen",wintype);
	}
	
	function deleteEstimateId(e,estimateId){ //해당 estimateId 가진 튜플 삭제함수
		
			e.preventDefault(); //<form action="companyEstimateList.do">이 실행되지않도록 막음
			
			//예외처리
			if(confirm("삭제하시겠습니까??")){		
					//해당 estimateId 가진 튜플 삭제
					 $.ajax({
						url:"${pageContext.request.contextPath}/companyEstimateDelete.do",
						data: { estimateId:  estimateId},
						success : function() {
							alert('삭제되었습니다');
							location.reload();
						}, error : function() {
							alert('에러발생');
						}
					});		 
			}
			else{
				alert("취소되었습니다");
				return false;
			}
		}
	
	function backMainBtn() {
		location.href = "${pageContext.request.contextPath }/companyMain.do";
	}
			
</script>

<style>
	tr:hover td {background:#ABCDEF !important};  /*마우스 hover 색상  */
</style>

<h4 class="mx-auto pb-2">의뢰목록</h4>
<br>		
<div class="container">

		<form name="searchFrm">
			<input type="hidden" name="page" value="1">
		</form>
		
		<form action="companyEstimateList.do">
			
			<table class="table text-center">
				<tr>
					<th><label>의뢰ID</label></th>
					<th><label>카테고리</label></th>
					<th><label>의뢰이름</label></th>
					<th><label>의뢰일</label></th>
					<th><label>진행상태</label></th>
					<th><label>시험일시</label></th>
					<th><label >삭제</label></th>
				</tr>
					<c:forEach items="${result.estimateList}" var="estimate">
					<tr>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.estimateId}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.categoryName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.estimateName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.requestDay}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.tradeProgressName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.examDate}</td>
						<td><button type="button" onClick="deleteEstimateId(event,${estimate.estimateId})"
								class="btn btn-danger" >삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<my:paging jsFunc="goList" paging="${result.paging}"/>
		
		<div align="right">
			<input type="button" id="backMainBtn" value="돌아가기" class="btn btn-info" onclick="backMainBtn()">
		</div>
	</div>	
