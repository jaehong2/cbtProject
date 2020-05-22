<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>설문조사</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
/* 
$(document).ready(function() {
	
}); 
*/
</script>
<script type="text/javascript">
	function checkForm() {
	    var q1 		= document.fmField.q1;
	    var q2 		= document.fmField.q2;
	    var q3 		= document.fmField.q3;
	    var q4 		= document.fmField.q4;
	    var q5 		= document.fmField.q5;
	    var q6 		= document.fmField.q6;
	    var q7 		= document.fmField.q7;
	    var q8 		= document.fmField.q8;
	    var q9 		= document.fmField.q9;
	     
	    // 입력 유무 체크
	    if(q1.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q2.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q3.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q4.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q5.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q6.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q7.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q8.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q9.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    document.fmField.submit();
	}
	</script>
</head>
<body>
<!--
 	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script> 
-->


	<header id="header"></header>
	<h1>설문조사</h1>
	<br><br><br><br>
	
	<!-- 7/19 june 설문지는 고정형식이라 문제은행식으로 할 필요가 없음 -> 추후 응시ID 불러오기 확인 필요 -->
	<form id="fmField" name="fmField" action="${pageContext.request.contextPath }/candidateSurvey.do" method="POST">
	<input type="hidden" name="surveyType" value="1"/>
	<input type="text" name="takeExamId" class="form-control" value="${takeExamId}" hidden="true"/>
	<input type="text" name="examId" class="form-control" value="${examId}" hidden="true"/>
		<table border="1" align="center" class="table text-center">
			<tr>
				<td>
					<h4 align="Left">1. 본 시험의 난이도는 적당했습니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q1" value="5">&nbsp;&nbsp;상당히 어려웠다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q1" value="4">&nbsp;&nbsp;어려운 편이다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q1" value="3">&nbsp;&nbsp;적절한 편이다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q1" value="2">&nbsp;&nbsp;쉬운 편이다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q1" value="1">&nbsp;&nbsp;상당히 쉬웠다 </label>
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">2. 본 시험의 출제 방향은 적절했습니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q2" value="5">&nbsp;&nbsp;매우 적절하다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q2" value="4">&nbsp;&nbsp;대체로 적절한 편이다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q2" value="3">&nbsp;&nbsp;일부는 적절하지 않았다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q2" value="2">&nbsp;&nbsp;대체로 적절하지 않았다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q2" value="1">&nbsp;&nbsp;방향성이 적절하지 않았다 </label>
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">3. 본 시험의 시험시간은 적당했습니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q3" value="5">&nbsp;&nbsp;충분했다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q3" value="4">&nbsp;&nbsp;충분한 편이다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q3" value="3">&nbsp;&nbsp;적절하다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q3" value="2">&nbsp;&nbsp;조금 부족하다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q3" value="1">&nbsp;&nbsp;매우부족하다&nbsp;&nbsp; </label>
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">4. 서버는 안정적이었습니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q4" value="5">&nbsp;&nbsp;매우 안정적이었다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q4" value="4">&nbsp;&nbsp;안정적인 편이다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q4" value="3">&nbsp;&nbsp;잠깐불안정하지만 시험에는 지장이 없는 수준이었다&nbsp;&nbsp;</label><br>
						<label><input type="radio" name="q4" value="2">&nbsp;&nbsp;불안정하여 시험에 영향을 받은 적이 있다&nbsp;&nbsp;</label><br>
						<label><input type="radio" name="q4" value="1">&nbsp;&nbsp;불안정하여 시험을 제대로 볼 수 없었다 </label>
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">5. 본 서비스를 다시 사용하실 의향은 있습니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q5" value="5">&nbsp;&nbsp;자주 방문할 것이다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q5" value="4">&nbsp;&nbsp;가끔씩 방문할 것이다&nbsp;&nbsp;  </label><br>
						<label><input type="radio" name="q5" value="3">&nbsp;&nbsp;생각해보겠다&nbsp;&nbsp;  </label><br>
						<label><input type="radio" name="q5" value="2">&nbsp;&nbsp;어쩔수 없다면 방문하겠다&nbsp;&nbsp;  </label><br>
						<label><input type="radio" name="q5" value="1">&nbsp;&nbsp;절대 사용하지 않겠다&nbsp;&nbsp; </label>
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">6. 본 서비스를 주변에 알리실 의향은 있습니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q6" value="5">&nbsp;&nbsp;적극적으로 알리겠다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q6" value="4">&nbsp;&nbsp;필요시 알리겠다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q6" value="3">&nbsp;&nbsp;굳이 알리지는 않겠다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q6" value="2">&nbsp;&nbsp;알리지 않겠다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q6" value="1">&nbsp;&nbsp;사용하지 말라고 알리겠다&nbsp;&nbsp; </label>
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">7. 이 시험으로 인해 얻고자하는 목표는 이루었습니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q7" value="1">&nbsp;&nbsp;전혀아니다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q7" value="2">&nbsp;&nbsp;아니지만 일부는 이루었다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q7" value="3">&nbsp;&nbsp;적당히 이루었다&nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q7" value="4">&nbsp;&nbsp;목표를 조금 초과달성하였다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q7" value="5">&nbsp;&nbsp;기대이상의 쾌거를 달성했다&nbsp;&nbsp; </label>
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">8. 이 시험을 준비하신 시간은 어느 정도입니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q8" value="1">&nbsp;&nbsp;전혀 준비하지 않았다&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q8" value="2">&nbsp;&nbsp;1주일&nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q8" value="3">&nbsp;&nbsp;1개월 이내 &nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q8" value="4">&nbsp;&nbsp;3개월 이내 &nbsp;&nbsp; </label> <br>
						<label><input type="radio" name="q8" value="5">&nbsp;&nbsp;3개월 이상 &nbsp;&nbsp; </label>
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">9. 이 시험을 준비하면서 지출한 금액은 얼마입니까?</h4><br>
					<p align="Left">
						<label><input type="radio" name="q9" value="1"> &nbsp; &nbsp; 전혀 없음 &nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q9" value="2"> &nbsp; &nbsp; 2만원 이하 &nbsp;&nbsp; </label><br>
						<label><input type="radio" name="q9" value="3"> &nbsp; &nbsp; 10만원 이하 &nbsp;&nbsp;</label><br>
						<label><input type="radio" name="q9" value="4"> &nbsp; &nbsp; 100만원 이하 &nbsp;&nbsp;</label><br>
						<label><input type="radio" name="q9" value="5"> &nbsp; &nbsp; 100만원 이상 </label>
					</p>
					<br>
				</td>
			</tr>
<!--
 			<button type="button">preview</button>
			<button type="button">next</button> 
-->
			</table>
			<div align="center">
				<input type="BUTTON" value="제출하기" class="btn btn-primary" onclick="checkForm()"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="초기화" class="btn btn-warning">
			</div>
		</form>
</body>
</html>