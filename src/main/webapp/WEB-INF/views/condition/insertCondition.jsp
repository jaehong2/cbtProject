<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
	<h4 class="mx-auto pb-2">상태 등록</h4>
	<form action="insertCondition.do" method="post" enctype="application/x-www-form-urlencoded">
		<label>마스터 코드 : </label><input type="text" name="masterCd" class="form-control"><br>
		<label>마스터 이름 : </label><input type="text" name="masterNm" class="form-control"><br>
		<label>상세 코드 : </label><input type="text" name="detailCd" class="form-control"><br>
		<label>상세 이름 : </label><input type="text" name="detailNm" class="form-control"><br>
		<label>사용 여부 : </label><input type="text" name="useYn" placeholder="Y or N" class="form-control"><br>
		
		<input type="submit" id="submit" value="등록" class="btn btn-primary m-3 p-3">
		
	</form>
