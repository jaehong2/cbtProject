<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {	
		$("#updateBtn").click(function() {
			if(confirm("계정을 수정 하시겠습니까?")){
				location.href='companyUpdate.do';
			} else{
				alert("수정이 취소 되었습니다.");
			}
			
		});
		
		$("#deleteBtn").click(function() {
			if(confirm("계정을 삭제 하시겠습니까?")){
				location.href='companyDelete.do';
			} else{
				alert("삭제 취소 되었습니다.");
			}
		});
	});
</script>
</head>
<body>
	<section>
		<article>
			<ul>
				<li><button type="button" id="updateBtn">수정</button></li>
				<li><button type="button" id="deleteBtn">삭제</button></li>
			</ul>
		</article>
	</section>
	
	<form action="">
		
	</form>
</body>
</html>