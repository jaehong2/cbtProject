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
         <li><a href="candidateRequestList.do"><button>응시목록</button></a></li>
         <li><a href="candidatePersonalChart.do"><button>통계</button></a></li>
      </ul>
   </article>
</section>
<h2>의뢰목록</h2>
<table border="1">
   <tr>
      <th>의뢰번호</th>
      <th>시험이름</th>
      <th>의뢰기업</th>
      <th>의뢰일</th>
      <th>담당자</th>
      <th>상세보기</th>   
   </tr>
   <tr>
      <td>1</td>
      <td>2019 제1차 URACLE 신입공채 시험</td>
      <td>URACLE</td>
      <td>2019-04-12</td>
      <td>이승환</td>
      <td><a href="candidateDetailRequestList.do"><button>상세보기</button></a></td>
   </tr>
   <tr>
      <td>2</td>
      <td>2019 제2차 URACLE 신입공채 시험</td>
      <td>URACLE</td>
      <td>2019-04-13</td>
      <td>이승환</td>
      <td><a href="candidateDetailRequestList.do"><button>상세보기</button></a></td>
   </tr>
      <tr>
      <td>3</td>
      <td>2019 제3차 URACLE 신입공채 시험</td>
      <td>URACLE</td>
      <td>2019-04-14</td>
      <td>이승환</td>
      <td><a href="candidateDetailRequestList.do"><button>상세보기</button></a></td>
   </tr>
      <tr>
      <td>4</td>
      <td>2019 제4차 URACLE 신입공채 시험</td>
      <td>URACLE</td>
      <td>2019-04-15</td>
      <td>이승환</td>
      <td><a href="candidateDetailRequestList.do"><button>상세보기</button></a></td>
   </tr>
</table>


</body>
</html>