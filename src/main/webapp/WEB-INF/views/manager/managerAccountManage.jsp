<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<h4 class="mx-auto pb-2">회사 계정 관리</h4>
<form action="${pageContext.request.contextPath }/managerAccountManage.do" method="post">
<input type="hidden" name="companyId" value="${result.companyId }">
<table width="940" style="padding:5px 0 5px 0;">
	  <tr>
	  	<th><label>아이디</label></th><td>${result.companyId }</td>
	  </tr>
      <tr>
         <th><label>패스워드</label></th><td><input type="text" name="companyPassword" class="form-control" value="${result.companyPassword }"></td>
      </tr>
      <tr>
        <th><label>기업명</label></th><td><input type="text" name="companyName" class="form-control" value="${result.companyName }"><br></td>
      </tr>
       <tr>
        <th><label>사업자번호</label></th><td><input type="text" name="businessNumber" class="form-control" value="${result.businessNumber }"><br></td>
      </tr>
      <tr>
         <th><label>회사분류</label></th>
         <td><my:select items="${E}" name="companyClassification" value="${result.companyClassification }"></my:select>
         </td>
      </tr>
      <tr>
         <th><label>세부업종</label></th>
         <td><my:select items="${F}" name="companySectors" value="${result.companySectors }"></my:select>
         </td>
      </tr>
      <tr>
         <th><label>결제정보</label></th><td><input type="text" name="companyCredit" class="form-control" value="${result.companyCredit }"></td>
      </tr>
      <tr>
         <th><label>담당자</label></th><td><input type="text" name="companyManager" class="form-control" value="${result.companyManager }"></td>
      </tr>
      <tr>
         <th><label>담당자연락처</label></th><td><input type="text" name="companyManagerTelNum" class="form-control" value="${result.companyManagerTelNum }"></td>
      </tr>
   </table>
   <!--테이블 끝-->
   
      <input type="submit" value="수정" class="btn btn-primary m-3 p-3">
      <input type="button" value="돌아가기" class="btn btn-warning m-3 p-3" onclick="location.href='../managerAccountList.do'">
      </form>
