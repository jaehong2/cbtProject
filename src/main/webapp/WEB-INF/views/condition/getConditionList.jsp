<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

	<h4 class="mx-auto pb-2">상태 목록</h4>
	
	
	<form action="deleteCondition.do">
	<table>
		<tr>
			<th><label>선택</label></th>
			<th><label>번호</label></th>
			<th><label>마스터코드</label></th>
			<th><label>마스터이름</label></th>
			<th><label>상세코드</label></th>
			<th><label>상세이름</label></th>
			<th><label>사용여부</label></th>
		</tr>
		<c:forEach items="${result}" var="condition">
		<tr>
			<td><input type="checkbox" name="CdTionList" value="${condition.conditionSeq }"></td>
			<td>${condition.conditionSeq }</td>
			<td><a href="updateCondition/${condition.conditionSeq }">${condition.masterCd }</a></td>
			<td>${condition.masterNm }</td>
			<td>${condition.detailCd }</td>
			<td>${condition.detailNm }</td>
			<td>${condition.useYn }</td>
		</tr>
		</c:forEach>
	</table>
	
	<button>삭제</button>
	</form>
	<a href="insertCondition.do">상태 등록</a>
