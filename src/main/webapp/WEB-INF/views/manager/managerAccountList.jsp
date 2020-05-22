<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<style type="text/css">
   .trexam {cursor: pointer; }
    tr.trexam:hover { background-color: lightblue; } 
   thead {background-color: lightgrey}
</style>

	<h4 class="mx-auto pb-2">기업회원 관리</h4>
	
	<script>
		function goList(p) {
			searchFrm.page.value = p;
			searchFrm.submit();
		}
	</script>
	<hr />
	<form name="searchFrm">
		정렬기준 
		<input type="hidden" name="page" value="1"> 
		<select name="sort" class="form-control">
			<option value="COMPANY_ID">기업ID
			<option value="COMPANY_NAME">기업이름
			<option value="COMPANY_MANAGER">담당자
		</select> 
		&nbsp;&nbsp;
		검색조건 <my:companyListSelect items="${companyMap }" />&nbsp;&nbsp;
		 <input type="text" name="searchKeyword" class="form-control" value="${CompanyVO.searchKeyword }">
		<button class="btn btn-primary">검색</button>
	</form>
	<script>
		searchFrm.sort.value = "${CompanyVO.sort}" == "" ? searchFrm.sort.options[0].value
							 : "${CompanyVO.sort}";
		searchFrm.searchCompany.value = "${CompanyVO.searchConsulting}" == "" ? searchFrm.searchCompany.options[0].value
						 	 : "${CompanyVO.searchCompany}";
	</script>
	<div class="container">
		<div class="btnGroup">
		<button type="button" class="btn btn-primary"
			onclick="location.href='managerAccountInsert.do'">기업 추가</button>
		</div>
		<form action="managerAccountDelete.do">
		<button id="" class="btn btn-danger">삭제</button>
			<table border="1" align="center" class="table">
				<thead>
				<tr>
					<th>선택</th>
					<th>기업ID</th>
					<th>기업명</th>
					<th>기업 담당자</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${result.companyList }" var="CompanyVO">
					<tr class="trexam">
						<td><label><input type="checkbox" name="companyList"
							value="${CompanyVO.companyId }"></label></td>
						<td>${CompanyVO.companyId }</td>
						<td><a href="managerAccountManage.do/${CompanyVO.companyId }">${CompanyVO.companyName }</a></td>
						<td>${CompanyVO.companyManager }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
		<br>
		<hr />
		<my:paging jsFunc="goList" paging="${result.paging }" />
	</div>
