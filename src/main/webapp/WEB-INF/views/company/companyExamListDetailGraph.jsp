<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>시험 통계</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
//		$("#chartBtn").click(function() {
			google.load("visualization", "1", {packages : ["corechart"]});
			google.setOnLoadCallback(loadPageData);

			$("#backExamListBtn").click(function() {
				location.href = "${pageContext.request.contextPath }/companyExamListDetail.do/${examId}";
			});
			
			function loadPageData() {
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath }/getTakeExamHistoryForExamIdList.do/${examId}",
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
								if(takerIdArr[i].takerId == row.takerId){
									takerIdArr[i].questionPoint += row.point;
									newId = false;
									break;
								}
							}
							if(newId == true){
								var takerIdPoint = {
										takerId : row.takerId,
										questionPoint : row.point
									}
								
								takerIdArr.push(takerIdPoint);
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
									qId: row.questionId,
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
					
 						console.log("응시자 id 목록 " + takerIdArr);
 						console.log(takerIdArr);
						console.log("응시 가능 인원 수 " + examApplicants);
						console.log("응시 인원 수 " + takerIdArr.length);
						console.log(totalScroeQuestionArr);
						console.log(takerScroeQuestionArr);
						console.log("합격 커트라인 점수 " + examPassingScore);
						
						for(var takerIndex = 0; takerIndex < takerIdArr.length; ++takerIndex){
							if(takerIdArr[takerIndex].questionPoint > examPassingScore){
								++passTakerCount;
								break;
							}
						}
						
						var chartAttendanceRateData = new google.visualization.DataTable();
						
						chartAttendanceRateData.addColumn('string', '인원');
						chartAttendanceRateData.addColumn('number', '점수');	
						
						chartAttendanceRateData.addRow([
							'미응시',
							examApplicants - takerIdArr.length
					    ]);
						
						chartAttendanceRateData.addRow([
							'응시',
							takerIdArr.length
					    ]);
						
						var AttendanceRateChartOptions = {
					            title : examName + " 응시율",
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
						
						var chart1 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart1.draw(chartAttendanceRateData, AttendanceRateChartOptions);
					    window.addEventListener('resize', function() { chart1.draw(chartAttendanceRateData, AttendanceRateChartOptions); }, false);
					
					    var chartPassExamRateData = new google.visualization.DataTable();
					    chartPassExamRateData.addColumn('string', '인원');
					    chartPassExamRateData.addColumn('number', '점수');	
						
					    chartPassExamRateData.addRow([
							'불합격인원',
							examApplicants - passTakerCount
					    ]);
						
					    chartPassExamRateData.addRow([
							'합격인원',
							passTakerCount
					    ]);
					    
					    var PassExamRateChartOptions = {
					            title : examName + " 합격율",
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
					    
					    var chart2 = new google.visualization.PieChart(document.getElementById('chartDiv2'));
						chart2.draw(chartPassExamRateData, PassExamRateChartOptions);
					    window.addEventListener('resize', function() { chart2.draw(chartPassExamRateData, PassExamRateChartOptions); }, false);
					    
					    var chartCorrectAnswerRateData = new google.visualization.DataTable();
					    
					    chartCorrectAnswerRateData.addColumn('string', '문제');
					    chartCorrectAnswerRateData.addColumn('number', '정답율');		    
					    
					    
					    var num = 1;
					    for(var qIdx = 0; qIdx < totalScroeQuestionArr.length; ++qIdx){
					    	var correctAnswerRate = (parseFloat(takerScroeQuestionArr[qIdx].questionPoint) / parseFloat(totalScroeQuestionArr[qIdx].questionPoint)) * 100;
					    	console.log(num + "문제" + correctAnswerRate);
					    	chartCorrectAnswerRateData.addRows([
					    		["문제 " + takerScroeQuestionArr[qIdx].qId, correctAnswerRate]
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
//		})
	});
</script>
</head>
<body>
	<h1 id="pageTitle">시험 통계</h1>
	<br>
	<!-- chart가 생성될 공간 -->
	<div id="chartDiv" style="float:left; width: 50%; height: 450px;"></div>
	<div id="chartDiv2" style="float:left; width: 50%; height: 450px;"></div>
	<div id="chartDiv3" style="float:left; width: 90%; height: 450px;"></div>
	<button id="backExamListBtn">시험상세로 돌아가기</button>
</body>
</html>