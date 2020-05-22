<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
<style type="text/css">
   .trexam {cursor: pointer; }
    tr.trexam:hover { background-color: lightblue; } 
   thead {background-color: lightgrey}
</style>

	<h4 class="mx-auto pb-2">매니저 목록</h4>
	<form>
		검색조건<select name="searchManager" class="form-control">
			<option value="managerId">관리자 아이디
			<option value="managerName">관리자 이름
		</select><br>
		<input type="text" name="searchManager" class="form-control">
		<button>검색</button>
	</form>
	<form action="deleteManager.do">
	<button id="">삭제</button>
	<table align="center">
		<tr>
			<th><label>선택</label></th>
			<th><label>관리자 아이디</label></th>
			<th><label>관리자 이름</label></th>
		</tr>
		<c:forEach items="${result.managerList }" var="manager">
		<tr class="trexam">
			<td><input type="checkbox" name="mngList" value="${manager.managerId }"></td>
			<td><a href="managerUpdateManager/${manager.managerId }">${manager.managerId }</a></td>
			<td>${manager.managerName }</td>
		</tr>
		</c:forEach>
	</table>
	</form>
	<br>
	<a href="managerInsertManager.do">매니저 등록</a>
