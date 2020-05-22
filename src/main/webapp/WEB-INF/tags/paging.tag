<!-- 19/06/27 재홍 tags 폴더 만들고 paging.tag 추가  -->
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.cbt.common.Paging"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 19/06/27 재홍 페이징 처리 버튼 생성 	https://getbootstrap.com/docs/4.3/components/pagination/-->
<!-- 19/07/16 페이징 버튼 처리 css 추가 밑 가운데 정렬 -->



<style>
	.center {
	  text-align: center;
	}
	
	.pagination {
	  display: inline-block;
	}
	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	  border: 1px solid #ddd;
	  margin: 0 4px;
	}
	
	.pagination a.active { 
	  background-color: #FF3333;
	  color: white;
	  border: 1px solid #FF3333;
	}
	
	.pagination a:hover:not(.active) {background-color: #ddd;}
</style>


<div class= "center">
	<c:if test="${empty jsFunc}">
		<c:set var="jsFunc" value="go_page"></c:set>
	</c:if>
	
	<div class="pagination">
		<a href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})">이전 </a>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="i">
				<c:if test="${i != paging.page}">
					<a href="javascript:${jsFunc}(${i})">${i}</a>
				</c:if>
				<c:if test="${i == paging.page}">
					<a class="active"
						href="javascript:${jsFunc}(${i})">${i}</a>
				</c:if>
			</c:forEach>
		<a href="javascript:${jsFunc}(${paging.lastPage<paging.endPage?paging.endPage+1:paging.endPage})">다음 </a>
	</div>
</div>
