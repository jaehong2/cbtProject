<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>

<div class="container">
  <h4>메일 보내기</h4>
  <form name="mailForm" action="${pageContext.request.contextPath}/managerExamSend.do" method="post" enctype="multipart/form-data">
    <div align="center"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" size="120" style="width:100%" placeholder="상대의 이메일" value="${selectedExam.companyEmail}" class="form-control" >
    </div>     
    <div align="center"><!-- 제목 -->
      <input type="text" name="subject" size="120" style="width:100%" placeholder="제목을 입력해주세요" value="${selectedExam.examName}" class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용#" class="form-control">
${selectedExam.companyId}님  ${selectedExam.questionQuantity} 문항을 첨부파일로 보내드리니 확인부탁드립니다.
전화로 연락 주시면 처리하겠습니다. 연락처 010-xxxx-xxxx으로 연락해주세요.
    													-예담기업-
      </textarea>
    </div>
    <div align="center">
      <input type="file" name="filename" style="width:100%" class="form-control">
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
</div>
