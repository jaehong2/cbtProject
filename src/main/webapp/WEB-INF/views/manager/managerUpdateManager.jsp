<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>

	<h4 class="mx-auto pb-2">매니저 정보 수정</h4>	
		
		<form action="${pageContext.request.contextPath }/managerUpdateManager.do" method="post">
			매니저 ID  : <input type="text" name="managerId" class="form-control" value="${manager.managerId }" readonly><br>
			매니저 PW  : <input type="password" name="managerPassword" class="form-control" value="${manager.managerPassword }"><br>
			매니저 이름 : <input type="text" name="managerName" class="form-control" value="${manager.managerName }"><br>
			<input type="submit" value="수정" class="btn btn-primary m-3 p-3">
			<a href="${pageContext.request.contextPath }/deleteManager.do?managerId=${manager.managerId }">삭제</a>	
		</form>
