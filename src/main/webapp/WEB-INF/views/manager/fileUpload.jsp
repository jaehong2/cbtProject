
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Home</title>
<script>
	$(document).ready(function() {
		$("#btn").click(function() {
			var form = $("#formUpload")[0];
			var data = new FormData(form);
			alert("시작");
			$.ajax({
				type: "POST",
				url: "excelUp.do",
				processData: false,   
				contentType: false,
				cache: false,
				data: data,
				success: function(result) {
					alert("성공");
				}
			});
		})
	});
</script>
</head>
<body>
<div align="center">
<br>
<br>
	<h2>시험 문제 업로드</h2>
	<br>
	<br>
	<form id="formUpload" name="formUpload" method="post" enctype="multipart/form-data">
    	<input type="file" id="fileInput" name="fileInput" value="엑셀업로드 작업" accept=".xlsx">
	</form>
	<br>
	<br>
   	<button id="btn">등록 하기</button> <button onclick='window.close()'>닫 기</button>
</div>
</body>
</html>
