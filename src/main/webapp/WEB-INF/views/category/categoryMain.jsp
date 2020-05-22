<!-- 2019.07.06 성재민 -->
<!-- 카테고리 목록을 전시하기 위해 생성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	//function setCategoryName(mainId, middleId, smallId) {
		/* $.ajax({
			type: "POST",
			url:"${pageContext.request.contextPath}/getCategoryMainName.do/" + mainId,
			success : function(data){
				$("#categoryMainName_" + mainId).text(data);
			}, error : function() {
				alert('에러발생');
			}
		}); */
		
		/* $.ajax({
			type: "POST",
			url:"${pageContext.request.contextPath}/getCategoryMiddleName.do/" + middleId,
			success : function(data){
				$("#categoryMiddleName_" + middleId).text(data);
			}, error : function() {
				alert('에러발생');
			}
		}); */
		
		/* $.ajax({
			type: "POST",
			url:"${pageContext.request.contextPath}/getCategorySmallName.do/" + smallId,
			success : function(data){
				$("#categorySamllName_" + smallId).text(data);
			}, error : function() {
				alert('에러발생');
			}
		}); */
	//};

	function categoryDelete(categoryId) {
		/* $.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath }/deleteCategory.do/" + categoryId,
			success : function() {
				location.reload();
			}
		}); */
		
		/* var deleteform = $("<form></form>");
		deleteform.attr("action", "${pageContext.request.contextPath }/deleteCategory.do/" + categoryId);
	    deleteform.attr("method", "POST");
	    deleteform.appendTo("body")
		deleteform.submit();  */
		
		location.href = "${pageContext.request.contextPath }/deleteCategory.do/" + categoryId;
	}
	
	function categoryInsert() {
		location.href = "${pageContext.request.contextPath }/insertCategory.do/";
	}
	
	function categoryUpdate(categoryId) {
		location.href = "${pageContext.request.contextPath }/updateCategory.do/" + categoryId;
	}
</script>


	<h3>카테고리 목록</h3>
	<div>
	<button id="insertCategoryBtn" name="insertCategoryBtn" class="btn btn-primary" onclick="categoryInsert()">카테고리 생성</button>
	</div>
	<!-- 2019.07.24 성재민 -->
	<!-- style="margin: auto;" 추가 -->
	<table border="1" style="margin: auto;">
		<tr>
			<th>카테고리 ID</th>
			<th>카테고리 이름</th>
			<th>대분류</th>
			<th>중분류</th>
			<th>소분류</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${categoryList}" var="category">
			<tr>
				<td>${category.categoryId}</td>
				<td>${category.categoryName}</td>
				<%-- <td id="categoryMainName_${category.categoryMainId}"></td>
				<td id="categoryMiddleName_${category.categoryMiddleId}"></td>
				<td id="categorySamllName_${category.categorySamllId}"></td> --%>
				<td>${category.categoryMainName}</td>
				<td>${category.categoryMiddleName}</td>
				<td>${category.categorySamllName}</td>
				<td><button id="updateBtn" class="btn btn-primary" onclick="categoryUpdate(${category.categoryId})">수정하기</button></td>
				<td><button id="deleteBtn" class="btn btn-warning" onclick="categoryDelete(${category.categoryId})">삭제하기</button></td>
			</tr>
			<!-- 2019.07.24 성재민 -->
			<!-- setCategoryName() 함수 부분 주석 추리 -->
			<!-- <script>setCategoryName("${category.categoryMainId}", "${category.categoryMiddleId}", "${category.categorySamllId}")</script> -->
		</c:forEach>
	</table>
