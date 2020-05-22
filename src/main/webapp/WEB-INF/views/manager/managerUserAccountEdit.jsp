<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<h4 class="mx-auto pb-2">응시자 계정관리</h4>
<form action="${pageContext.request.contextPath}/managerUserAccountEdit.do" method="post">
<input type="hidden" name="takerId" value="${result.takerId }">
<table border="1" align="center">
   <tr>
      <th><label>응시자ID</label></th>
      <td>${result.takerId}</td> 
   </tr>
   <tr>
      <th><label>비밀번호</label></th>
      <td><input type="password" name="takerPassword" class="form-control" value="${result.takerPassword }"></td> 
   </tr>
   <tr>
      <th><label>이름</label></th>
      <td><input type="text" name="takerName" class="form-control" value="${result.takerName }"></td> 
   </tr>
   <tr>
      <th><label>생년월일</label></th>
      <td><input type="text" name="takerInfo" class="form-control" value="${result.takerInfo }"></td> 
   </tr>
      <tr>
      <th><label>최종학력</label></th>
      <td><my:select items="${J}" name="takerEducation" value="${result.takerEducation }"></my:select>
      </td> 
   </tr>
    <tr>
      <th><label>이메일</label></th>
      <td><input type="text" name="takerEmail" class="form-control" value="${result.takerEmail }"></td> 
   </tr>
   <tr>
   	  <th><label>연락처</label></th>
   	  <td><input type="text" name="takerPhoneNum" class="form-control" value="${result.takerPhoneNum }"></td>
   </tr>
</table>

	<input type="submit" value="수정" class="btn btn-primary m-3 p-3">
	<input type="button" value="돌아가기" class="btn btn-primary m-3 p-3" onclick="location.href='../managerUserAccountList.do'">
</form>
