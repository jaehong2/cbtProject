<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<style>
    tr:hover td {background:#ABCDEF !important}; /*마우스 hover 색상  */
</style>

<script>
	//페이징처리
	function goList(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
	function estimateDetail(estimateId){
		console.log("estimateId :" + estimateId);
		var wintype = "toolbar=no,width=700,height=700,top=100,left=370,directories=no,menubar=no,scrollbars=yes";// 의뢰 디테일을 보기위한 윈도우창 띄움
		var winopen = window.open("managerEstimateDetail.do/"+estimateId,"windowopen",wintype);
	}
	
	function deleteEstimateId(e,estimateId){ //해당 estimateId 가진 튜플 삭제함수
		console.log(estimateId);
		e.preventDefault(); //<form action="companyEstimateList.do">이 실행되지않도록 막음
		
		//예외처리
		if(confirm("삭제하시겠습니까??")){		
				//해당 estimateId 가진 튜플 삭제
				 $.ajax({
					url:"${pageContext.request.contextPath}/managerEstimateDelete.do",
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
</script>

</head>
<body>
	
	<h4 class="mx-auto pb-2">의뢰목록</h4>
	<hr/>

	<div class="container" >
		<!-- 페이징 처리폼 -->
		<form name="searchFrm">
			<input type="hidden" name="page" value="1">
			<!-- 190803 검색 수정부분 -->
		<%-- 검색조건 <my:estimateListSelect items="${estimateMap }"/>&nbsp;&nbsp;
		<input type="text" name="searchKeyword" value="${ConsultingVO.searchKeyword }">
		<button class="btn btn-primary">검색</button>  --%>
		</form>
	<script>
		searchFrm.searchConsulting.value="${ConsultingVO.searchConsulting}"==""
									?searchFrm.searchConsulting.options[0].value
									:"${ConsultingVO.searchConsulting}";
	</script>
			<!-- 190803 검색 수정부분 -->
		<div style="text-align: right">
			<button type="button" class="btn btn-primary" value="등록"
				id="btnInsert" onclick="location.href='managerEstimateInsert.do'">의뢰등록</button>
		</div>
		<br>
		<form action="companyEstimateList.do">

			<table border="1" class="table table-striped">
				<tr>
					<th><label>의뢰ID</label></th>
				
					<th><label>카테고리</label></th>
					<th><label>의뢰이름</label></th>
					<th><label>의뢰일</label></th>
					<th><label>진행상태</label></th>
					<th><label>시험일시</label></th>
					<th><label>시험출제</label></th>
					<th><label>삭제</label></th>
				</tr>
				<c:forEach items="${result.estimateList}" var="estimate">
					<tr>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.estimateId}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.categoryName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.estimateName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.requestDay}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.tradeProgressName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.examDate}</td>
						<td><button type="button" class="btn btn-primary" onClick="location.href ='managerExamInsert.do/${estimate.estimateId}'">시험출제</button></td>
						<td><button type="button" class="btn btn-danger" onClick="deleteEstimateId(event,${estimate.estimateId})">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<my:paging jsFunc="goList" paging="${result.paging}" />

	</div>