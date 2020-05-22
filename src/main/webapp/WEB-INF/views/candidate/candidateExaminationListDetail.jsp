<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>응시 세부 목록</title>
<style>
	.wrap {
		height: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.button {
		width: 140px;
		height: 45px;
		font-family: 'Roboto', sans-serif;
		font-size: 14px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: #fff;
		background-color: #5F5E5E;
		border: none;
		border-radius: 45px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}
	
	.button:hover {
		background-color: lightblue;
		box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		color: #fff;
		transform: translateY(-7px);
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#chartBtn").click(function() {
			google.load("visualization", "1", {packages : ["corechart"]});
			google.setOnLoadCallback(loadPageData);

			function loadPageData() {
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath }/getTakeExamHistoryForTakerIdAndExamIdList.do/${candidateExaminationListDetail.takeExamId}",
					success: function(data) {
						var chartData 	= new google.visualization.DataTable();
						var takeScore 	= 0;
						var testName 	= data[0].examName;
						var passScore	= data[0].passingScore;		
						
						chartData.addColumn('string', '점수');
						chartData.addColumn('number', '점수');		
						
						data.forEach(function (row) {
							takeScore += row.takerScore;
						});
						
						chartData.addRow([
							'총점',
							100
					    ]);
						
						chartData.addRow([
							'합격점수',
							passScore
					    ]);
						
						chartData.addRow([
							'획득점수',
							takeScore
					    ]);
						
						var options = {
					            title : testName,
					            chartArea : {
					                width : '80%'
					            },
					            hAxis : {
					                title : '점수',
					                minValue : 0
					            },
					            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' }
					        };
						
						var chart = new google.visualization.BarChart(document.getElementById('chartDiv'));
						chart.draw(chartData, options);
					    window.addEventListener('resize', function() { chart.draw(chartData, options); }, false);
					}
				});
				
			 	$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath }/getTakeExamHistoryForExamIdList.do/${candidateExaminationListDetail.examId }",
					success: function(data) {
						console.log(data);
						
						if(data.length <= 0){
							return;
						}
						
						var examApplicants 			= 0;			// 2019.07.17 성재민 // 응시가능 인원
						var examQuestionQuantity	= 0;			// 2019,07,17 성재민 // 출제 문항 수
						var examPassingScore		= 0
						var examName 				= "";
						var passTakerCount 			= 0;
						
						examApplicants 			= data[0].applicants;
						examQuestionQuantity 	= data[0].questionQuantity;
						examPassingScore		= data[0].passingScore;
						examName 				= data[0].examName;
						
						console.log(examApplicants);
						console.log(examQuestionQuantity);
						console.log(examPassingScore);
						console.log(examName);

						$("#pageTitle").text(examName + " 통계");
						
						var takerIdArr 				= new Array();	// 2019.07.17 성재민 // 응시자 id 저장 변수
						var totalScroeQuestionArr	= new Array();
						var takerScroeQuestionArr	= new Array();
						
						var newId 	= true;	// 2019.07.17 성재민 // 응시자 이름 체크 변수(배열에 push 할때.)
						var idx 	= 0;
						data.forEach(function (row) {	
							for(var i = 0; i < takerIdArr.length; ++i) {
								if(takerIdArr[i] == row.takerId){
									newId = false;
									break;
								}
							}
							if(newId == true){
								takerIdArr.push(row.takerId);
							}
							
							var questionIdPoint = {
								questionId : row.setExamQuestionId,
								questionPoint : row.point
							}
							
							var isNewQuestion = true;
							for(var questionIdx = 0; questionIdx < totalScroeQuestionArr.length; ++questionIdx){
								if(totalScroeQuestionArr[questionIdx].questionId == row.setExamQuestionId){
									totalScroeQuestionArr[questionIdx].questionPoint += row.point;
									if(row.takerScore == null || row.takerScore == undefined){
										takerScroeQuestionArr[questionIdx].questionPoint += 0;
									} else{
										takerScroeQuestionArr[questionIdx].questionPoint += row.takerScore;
									}
									
									isNewQuestion = false;
								}
							}
							
							if(isNewQuestion == true) {
								totalScroeQuestionArr.push(questionIdPoint);
								
								
								var takerIdPoint = {
									questionId : row.setExamQuestionId,
									questionPoint : row.takerScore
								}
								
								if(row.takerScore == null || row.takerScore == undefined){
									takerIdPoint.questionPoint = 0;
								}
								
								console.log("값체크");
								console.log(takerIdPoint);		
								
								takerScroeQuestionArr.push(takerIdPoint);
							}
						});
					
 						
					    var chartCorrectAnswerRateData = new google.visualization.DataTable();
					    
					    chartCorrectAnswerRateData.addColumn('string', '문제');
					    chartCorrectAnswerRateData.addColumn('number', '정답율');		    
					    
					    
					    var num = 1;
					    for(var qIdx = 0; qIdx < totalScroeQuestionArr.length; ++qIdx){
					    	var correctAnswerRate = (parseFloat(takerScroeQuestionArr[qIdx].questionPoint) / parseFloat(totalScroeQuestionArr[qIdx].questionPoint)) * 100;
					    	console.log(num + "문제" + correctAnswerRate);
					    	chartCorrectAnswerRateData.addRows([
					    		["문제 " + num++, correctAnswerRate]
					    	]);
					    }		    
					    
					    var CorrectAnswerRateChartOptions = {
					    		title : examName + " 문제별 정답율",
					            chartArea : {
					                width : '80%'
					            },
					            hAxis : {
					                title : '문제',
					                minValue : 1
					            },
					            vAxis : {
					            	title: '정답율', minValue: 0, maxValue: 100
					            },
					            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' }
					        };
					    
					    var chart3 = new google.visualization.LineChart(document.getElementById('chartDiv3'));
						chart3.draw(chartCorrectAnswerRateData, CorrectAnswerRateChartOptions);
					    window.addEventListener('resize', function() { chart3.draw(chartCorrectAnswerRateData, CorrectAnswerRateChartOptions); }, false);
					}	
				});
			}
		})
	});
</script>
</head>
<body>

	<h4 class="mx-auto pb-2">응시 결과</h4>
	<br>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	<c:set var="examName" value="${candidateExaminationListDetail.examName }" />
	<c:set var="examId" value="${candidateExaminationListDetail.examId }" />
	<c:set var="examStartTime" value="${candidateExaminationListDetail.examStartTime }" />
	<c:set var="takerName" value="${candidateExaminationListDetail.takerName }" />
	<c:set var="takeExamId" value="${candidateExaminationListDetail.takeExamId }" />
	<c:set var="takerInfo" value="${candidateExaminationListDetail.takerInfo }" />
	<c:set var="score" value="${candidateExaminationListDetail.score }" />
	<c:set var="passingScore" value="${candidateExaminationListDetail.passingScore }" />
	<table class="table text-center">
	<%-- <c:forEach items="candidateExaminationListDetail" var="list"> --%>
		<tr>
			<th>시험명</th>
			<td>${examName }</td>
		</tr>
		<tr>
			<th>시험 일시</th>
			<td>${examStartTime }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${takerName }</td>
		</tr>
		
		<tr>
			<th>주민번호</th>
			<td>${takerInfo }</td>
		</tr>
		<tr>
			<th>점수</th>
			<td>${score } / ${passingScore }</td>
		</tr>
		
		<tr>
			<th>합격여부</th>
			<td>
				<c:if test="${passingScore lt score }">합격</c:if>
				<c:if test="${passingScore ge score }">불합격</c:if>
			</td>
		</tr>
	<%-- </c:forEach> --%>
	</table>
	<!-- 2019.07.16 성재민 -->
	<!-- 통계보기 버튼 추가 -->
	<br>
	<div>
		<button id="chartBtn" class='btn btn-primary'>통계보기</button>
		<a href="${pageContext.request.contextPath }/candidateRightAnswer.do/${examId}"><button class='btn btn-warning'>풀이보기</button></a>
	</div>
	<!-- chart가 생성될 공간 -->
	<!-- chart가 생성될 공간 -->
	<div id="chartDiv"></div>
	<div id="chartDiv3" style="float:left; width: 90%; height: 450px;"></div>
</body>
</html>