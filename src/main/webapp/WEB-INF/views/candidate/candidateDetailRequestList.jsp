<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<style>

</style>
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><a href="candidateAccountManageModify.do"><button>계정관리</button></a></li>
         <li><a href="commonDetailRequestList.do"><button>응시목록</button></a></li>
         <li><a href="candidatePersonalChart.do"><button>통계</button></a></li>
      </ul>
   </article>
</section>
<h2>세부 의뢰목록</h2>
<table border="1">
   <tr>
      <th>시험 분류</th>
      <td>신입공채</td>
   </tr>
   <tr>
      <th>시험명</th>
      <td>제1차 URACLE 신입공채 시험</td>
   </tr>
   <tr>
      <th>업종</th>
      <td>IT</td>
   </tr>
   <tr>
      <th>담당자</th>
      <td>에릭 슈미트</td>
   </tr>
   <tr>
      <th>연락처</th>
      <td>010-2222-3333</td>
   </tr>
   <tr>
      <th>이메일</th>
      <td>ceo@gmail.com</td>
   </tr>
   <tr>
      <th>시험내용</th>
      <td><textarea name="content">이시험은 OO기업 재직자를 위한 테스트입니다.</textarea></td>
   </tr>
   <tr>
      <th>시험상태</th>
      <td><select name="status">
         <option value="">시험상태</option>
         <option value="">시험 대기</option>
         <option value="">시험 완료</option>
      </select></td>
   </tr>
   <tr>
      <th>시험일</th>
      <td>2019-06-17 15:00 ~ 18:00</td>
   </tr>
</table>
   <a href="candidateRequestList.do"><button type="button" value="reset">돌아가기</button></a>
</body>
</html>