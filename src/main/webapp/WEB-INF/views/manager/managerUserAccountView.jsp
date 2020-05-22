<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<style>

</style>
</head>
<body>
<!-- 마이페이지<개인> 계정관리--> 
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><button type="button" onclick="location.href='managerUserAccountEdit.do'">계정관리</button></li>
         <li><button type="button" onclick="location.href='candidateRequestList.do'">응시목록</button></li>
         <li><button type="button" onclick="location.href='managerChart.do'">통계</button></li>
      </ul>
   </article>
</section>
<h1>계정관리</h1>
<table width="940" style="padding:5px 0 5px 0;">
      <tr>
        <th>ID</th>
        <td>${getManagerUserAccountView.takerId}</td>
      </tr>
      <tr>
         <th>패스워드</th>
         <td>${getManagerUserAccountView.takerPassword}</td>
      </tr>
      <tr>
         <th>이름</th>
         <td>${getManagerUserAccountView.takerName}</td>
      </tr>
      <tr>
         <th>주민등록번호</th>
         <td>${getManagerUserAccountView.takerInfo}</td>
      </tr>
 
      <tr>
         <th>연락처</th>
         <td>${getManagerUserAccountView.takerEducation}</td>
      </tr>
      <tr>
         <th>이메일</th>
         <td>${getManagerUserAccountView.takerEmail}</td>
         </tr>
   </table>
   <!--테이블 끝-->
   <!-- 수정버튼 이벤트 어떻게 할건지 정의하자 -->
      <button type="button" value="submit" onclick="location.href=''">수정</button>
      <button type="button" value="reset" onclick="location.href='candidateMain.do'">돌아가기</button>
   
   
   

</body>
</html>