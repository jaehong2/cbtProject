<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script>
$(document).ready( function () {
    $('#table_id').DataTable();
} );
</script>
	<h4 class="mx-auto pb-2">관리자 문제관리 목록</h4>
	<div align="right">
		[<a href="" onclick='window.open("${pageContext.request.contextPath }/managerFileUpload.do","fileUp","width=600,height=300");'>엑셀 업로드</a>] [<a href="<c:url value='${pageContext.request.contextPath }/excelDown.do' />">엑셀 다운</a>]
	</div>
	<table id="table_id" class="display">
		<thead>
			<tr>
				<th><label>번호</label></th>
				<th><label>내용</label></th>
				<th><label>보기1</label></th>
				<th><label>보기2</label></th>
				<th><label>보기3</label></th>
				<th><label>보기4</label></th>
				<th><label>정답</label></th>
				<th><label>해설</label></th>
				<th><label>난이도</label></th>
				<th><label>카테고리</label></th>
				<th><label>타입</label></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${examList}">
				<tr>
					<td>${item.questionId}</td>
					<td>${item.questionContent}</td>
					<td>${item.example1}</td>
					<td>${item.example2}</td>
					<td>${item.example3}</td>
					<td>${item.example4}</td>
					<td>${item.rightAnswer}</td>
					<td>${item.rightCommentary}</td>
					<td>${item.levelOfDifficulty}</td>
					<td>${item.categoryId}</td>
					<td>${item.questionType}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>