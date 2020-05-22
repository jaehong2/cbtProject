<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my"  tagdir="/WEB-INF/tags"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<style type="text/css">
	.trexam {cursor: pointer; }
	 tr.trexam:hover { background-color: lightblue; } 
	thead {background-color: lightgrey}
</style>
<script type="text/javascript">

	$(document).ready(function() {	
		$("#deleteBtn").click(function() {
			if(confirm("계정을 탈퇴 하시겠습니까?")){
				document.fmField.submit();
			} else{
				alert("수정이 취소 되었습니다.");
			}
			
		});
	});
</script>

</head>
<body>

<h4 class="mx-auto pb-2">계정 삭제</h4>

<form id="fmField" name="fmField" action="deleteCandidate.do" method="POST">
<input type="hidden" name="takerId" value="${candidate.takerId}"/>
	<table class="table text-center">
		<thead class="table-success">
			<tr>
				<th colspan="2"><h4>${candidate.takerName}님의 정보입니다.</h4></th>
			</tr>
		</thead>
		<tbody>
	      <tr>
	        <th>ID</th>
	        <td>${candidate.takerId}</td>
	      </tr>
	      <tr>
	         <th>이름</th>
	         <td>${candidate.takerName}</td>
	      </tr>
	      <tr>
	         <th>연락처</th>
	         <td>${candidate.takerInfo}</td>
	      </tr>
	      <tr>
	         <th>이메일</th>
	         <td>${candidate.takerEmail}</td>
	      </tr>
	   </tbody>
	</table>
<!--테이블 끝-->
<!-- <button class="btn btn-warning m-3 p-3">삭제</button> -->
<input type="button" name="deleteBtn" id="deleteBtn" onclick="deleteBtn();" value="탈퇴하기" class="btn btn-primary"/> &nbsp; <input type="reset" value="취소" class="btn btn-warning"/>

</form>
   
 <!--      <button type="button" value="submit" onclick="alert('수정되었습니다.')">수정확인</button> -->
      <button type="button" class="btn btn-primary m-3 p-3" value="reset" onclick="location.href='candidateMain.do'"> 돌아가기 </button>
