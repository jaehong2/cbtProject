<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
	<h4 class="mx-auto pb-2">Board List</h4>
	<div align="right">
		[<a href="<c:url value='/excelDown.do' />">엑셀 다운</a>]
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>보기1</th>
				<th>보기2</th>
				<th>보기3</th>
				<th>보기4</th>
				<th>정답</th>
				<th>해설</th>
				<th>난이도</th>
				<th>카테고리</th>
				<th>타입</th>
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
</body>
</html>