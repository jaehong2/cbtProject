<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="managerExcelUpload.do" id="formUpload" name="formUpload" method="post" enctype="multipart/form-data">
    	<input type="file" id="fileInput" name="fileInput" value="엑셀업로드 작업" accept=".xlsx">
    	<br><br><input type="submit" value="파일업로드">
	</form>
</body>
</html>