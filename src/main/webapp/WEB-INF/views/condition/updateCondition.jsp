<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h4 class="mx-auto pb-2">상태정보 수정</h4>	
		
		<form action="${pageContext.request.contextPath }/updateCondition.do" method="post">
			<input type="hidden" name="conditionSeq" value="${condition.conditionSeq }"/>
			<label>마스터 코드  : </label><input type="text" name="masterCd" value="${condition.masterCd }" class="form-control"><br>
			<label>마스터 이름  : </label><input type="text" name="masterNm" value="${condition.masterNm }" class="form-control"><br>
			<label>상세 코드 : </label><input type="text" name="detailCd" value="${condition.detailCd }" class="form-control"><br>
			<label>상세 이름 : </label><input type="text" name="detailNm" value="${condition.detailNm }" class="form-control"><br>
			<label>사용 여부 : </label><input type="text" name="useYn" value="${condition.useYn }" class="form-control">
			<input type="submit" value="수정" class="btn btn-primary m-3 p-3">
			<a href="${pageContext.request.contextPath }/deleteCondition.do?conditionSeq=${condition.conditionSeq }">삭제</a>
			
		</form>
