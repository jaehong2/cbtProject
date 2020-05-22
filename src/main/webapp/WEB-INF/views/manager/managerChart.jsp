<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 align="center">기업별합격률</h1>
<img src="../image/관리자통계.PNG">
   
   
   
<div class="container">
<h2>문제 유형별 정답률</h2>
<div id="demo-1"></div>

<script src="../js/Easygraphs.js"></script>
<script>
var eg1 = new Easygraphs({
  container: document.getElementById('demo-1'),
  width: 880,
  height: 200,
  padding: {
    top: 30,
    right: 30,
    left: 55
  },
  tooltip: {
    template: '합격률: {{ value }}',
    widthAuto: true,
    color: '#222',
    background: '#FFF'
  },
  yAxis: {
    text: {
      toFixed: 0
    },
    title: {
      text: '점수'
    },
    grid: {
      dasharray: '1%'
    }
  },
  xAxis: {
    labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],
    grid: {
      dasharray: '1%'
    }
  },
  data: [{
    name: '문제별 합격률',
    dots: {
      color: 'rgb(246, 75, 47)'
    },
    line: {
      width: 2,
      color: 'rgb(246, 75, 47)',
      fill: 'rgba(246, 75, 47, 0.5)'
    },
    values: [12, 22, 25, 23, 32, 34, 37, 30, 32, 40, 98, 56, 52, 70, 68, 72, 74, 78, 56, 35, 5, 15, 53, 21, 33, 55, 76, 68, 72, 71,33]
  }]
});
eg1.render();

</script>
</div>   
</body>
</html>