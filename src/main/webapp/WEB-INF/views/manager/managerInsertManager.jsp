<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h4 class="mx-auto pb-2">매니저 등록</h4>
	<form action="managerInsertManager.do" method="post" enctype="application/x-www-form-urlencoded">
		매니저 ID : <input type="text" name="managerId" class="form-control"><br>
		매니저 PW : <input type="password" name="managerPassword" class="form-control"><br>
		매니저 이름 : <input type="text" name="managerName" class="form-control"><br>
		
		<input type="submit" id="submit" value="등록" class="btn btn-primary m-3 p-3">
		
	</form>
