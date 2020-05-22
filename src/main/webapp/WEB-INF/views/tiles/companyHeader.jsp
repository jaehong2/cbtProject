<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="w3-top" style="z-index: 10001; ">  <!-- 마이페이지가 창이 더 앞에 나올수있또록 z축설정-->
	<div class="w3-bar w3-black w3-card" style="background-color: green">
	<sec:authorize access="!hasRole('ROLE_COMPANY') ">
  	 <sec:authorize access="!hasRole('ROLE_MANAGER') ">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <!-- 2019.07.09 성재민 -->
    <!-- cbt 클릭시 메인화면으로 -->
    <a href="${pageContext.request.contextPath }/candidateMain.do" class="w3-bar-item w3-button w3-padding-large">CBT</a>
    <a href="${pageContext.request.contextPath }/candidateInIntroduce.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회사소개</a>
    <!-- 2019.07.09 성재민 -->
    <!-- 시험일정 메뉴 연결 -->
     <a href="${pageContext.request.contextPath }/candidateScheduleCheck.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a>
<%-- 
	<c:if test="${not empty sessionScope.candidate }"> 
	     <a href="${pageContext.request.contextPath }/candidateScheduleCheck.do/${candidate.takerId}" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a> 
	</c:if>
	<c:if test="${empty sessionScope.candidate }"> 
	    <a href="${pageContext.request.contextPath }/candidateLogin.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a>
	</c:if> 
--%>
	<!-- 2019.07.18 성재민 -->
	<!-- 문의하기 버튼 클릭시 채팅 창으로 연결 -->
	<script type="text/javascript">
		function connectChat() {
			var wintype = "toolbar=no,width=800px,height=900px,top=50,left=420,directories=no,menubar=no,scrollbars=yes";// 윈도우창 띄움
			var winopen = window.open("${pageContext.request.contextPath }/chat.do","windowopen",wintype);
		}
	</script>
    <a href="#" onclick="connectChat()" class="w3-bar-item w3-button w3-padding-large w3-hide-small">문의하기</a>
    	</sec:authorize>
	</sec:authorize>  
	
	<sec:authorize access="hasRole('ROLE_COMPANY')">
    	<a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    	<a href="${pageContext.request.contextPath }/companyMain.do" class="w3-bar-item w3-button w3-padding-large">CBT</a>
    	<a href="${pageContext.request.contextPath }/companyIntroduce.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회사소개</a>
    	<a href="${pageContext.request.contextPath }/companySystemintro.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시스템소개</a>
    	<a href="${pageContext.request.contextPath }/companyConsultingInsert.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">상담하기</a>
법인메뉴
    	<div class="w3-dropdown-hover" >
      		<button class="w3-padding-large w3-button" title="More">마이페이지<i class="fa fa-caret-down"></i></button>     
     		 <div class="w3-dropdown-content w3-bar-block w3-card-4" >
        		<a href="${pageContext.request.contextPath }/companyAccount.do" class="w3-bar-item w3-button">계정관리</a>
       	 		<a href="${pageContext.request.contextPath }/companyEstimateList.do" class="w3-bar-item w3-button">의뢰목록</a>
        		<a href="${pageContext.request.contextPath }/companyConSultingList.do" class="w3-bar-item w3-button">상담목록</a>
        		<a href="${pageContext.request.contextPath }/companyExamList.do" class="w3-bar-item w3-button">시험목록</a>
        		<a href="${pageContext.request.contextPath }/companyChart.do" class="w3-bar-item w3-button">통계</a>
      		</div>
    	</div>
    </sec:authorize>
    
    	<!-- 2019.07.09 성재민 -->
    	<!-- 로그인 여부에 따라 로그인/로그아웃이 표시 -->
    	<sec:authorize access="isAnonymous()"> 
    		<a href="${pageContext.request.contextPath }/companyLogin.do" class="w3-padding-large w3-hover-red w3-hide-small w3-right">로그인</a>
    		<a href="${pageContext.request.contextPath }/companySignUp.do" class="w3-padding-large w3-hover-red w3-hide-small w3-right">회원가입</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">  
    		<a href="${pageContext.request.contextPath }/logout" class="w3-padding-large w3-hover-red w3-hide-small w3-right">${company.companyId }로그아웃</a>
		</sec:authorize>
  	</div>
</div>

