<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


<%--   <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/css/business-frontpage.css" rel="stylesheet">
 --%>
 <script type="text/javascript">
 	function connectChat() {
		var wintype = "toolbar=no,width=800px,height=900px,top=50,left=420,directories=no,menubar=no,scrollbars=yes";// 윈도우창 띄움
		var winopen = window.open("${pageContext.request.contextPath }/chat.do","windowopen",wintype);
	}
</script>
</head>

<body>

  <!-- Header -->
  <header class="bg-info py-5 mb-5">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">Computer Based Testing(CBT)</h1>
          <p class="lead mb-5 text-white-50">기업고객님 환영합니다.</p>
        </div>
      </div>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <div class="row">
      <div class="col-md-8 mb-5">
        <h2>CBT란?</h2>
        <hr>
        <p>컴퓨터를 이용하여 시험에 응시하고 성적 처리도 컴퓨터를 통해 이루어지는 시험방식입니다. </p>
        <p>기업에 필요한 인재, 적합한 인재를 찾아드립니다!</p>
        <p>해설, 모의고사, 오답노트, 자동채점, 교사용/학생용 성적관리</p>
        <a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/companySystemintro.do">시스템 소개 &raquo;</a>
      </div>
      <div class="col-md-4 mb-5">
        <h2>Contact Us</h2>
        <hr>
        <address>
          <strong>예담3반</strong>
          <br>대구광역시 중구
          <br>한양학원 건물, 5층
          <br>
        </address>
        <address>
          <abbr title="Phone">전화번호</abbr>
          (053) 456-7890
          <br>
          <abbr title="Email">이메일</abbr>
          <a href="mailto:#">yedam11@naver.com</a>
        </address>
      </div>
    </div>
    <!-- /.row -->

    <div class="row">
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="${pageContext.request.contextPath}/image/1.jpg">
          <div class="card-body">
            <h4 class="card-title">회사소개</h4>
            <p class="card-text">CBT는 채용의 전문가 집단으로 구성된 </p><p>채용솔루션/채용대행 전문기업입니다.</p>
          </div>
          <div class="card-footer">
            <a href="${pageContext.request.contextPath}/companyIntroduce.do" class="btn btn-info">회사소개</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="${pageContext.request.contextPath}/image/2.jpg">
          <div class="card-body">
            <h4 class="card-title">의뢰목록보기</h4>
            <p class="card-text">지금 의뢰하신 내용이 궁금하세요?</p><p>직접 확인해보세요!</p>
          </div>
          <div class="card-footer">
            <a href="${pageContext.request.contextPath}/companyEstimateList.do" class="btn btn-info">시험일정</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <img class="card-img-top" src="${pageContext.request.contextPath}/image/3.jpg">
          <div class="card-body">
            <h4 class="card-title">상담하기</h4>
            <p class="card-text">상담을 원하는 사항이 있으신가요?</p><p>24시간 내내 관리자가 기다리고있을께요!</p>
          </div>
          <div class="card-footer">
            <a href="${pageContext.request.contextPath }/companyConsultingInsert.do" class="btn btn-info">상담하기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->



<!--   
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>

</html>
