<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function connectChat(inquiryRoomId) {
		var wintype = "toolbar=no,width=800px,height=900px,top=50,left=420,directories=no,menubar=no,scrollbars=yes";// 윈도우창 띄움
		var winopen = window.open("${pageContext.request.contextPath }/chatRoomId.do/" + inquiryRoomId,"windowopen",wintype);
	}
</script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>

	<h3>문의 목록</h3>
	<c:if test="${empty InquiryList}">
		<h3>문의 사항이 없습니다.</h3>
	</c:if>
	<c:if test="${not empty InquiryList}">
		<table border="1" align="center" class="table table-striped">
			<tr >
				<th><label>문의번호</label></th>
				<th><label>문의자</label></th>
				<th><label>문의내용</label></th>
				<th><label>문의시간</label></th>
				<th><label>처리상태</label></th>
			</tr>
			<c:forEach items="${InquiryList}" var="inquiry">
				<tr onclick="connectChat('${inquiry.inquiryRoomId}')">
					<td>${inquiry.inquiryId}</td>
					<td>${inquiry.inquiryTakerId}</td>
					<td>${inquiry.inquiryContent}</td>
					<td>${inquiry.inquiryTime}</td>
					<td>${inquiry.replyStatus}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
