<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>관리자: 회원정보목록</title>
</head>

<!-- 관리자 role인지 확인하기 -->
<body>
  <!-- 관리자페이지 헤더 -->
  <jsp:include page="../fix/admin_header.jsp"></jsp:include>
  
  <div class="container-fluid">
    <div class="row">
    <!-- 관리자페이지 목록 -->
    <jsp:include page="../fix/admin_nav.jsp"></jsp:include>
  	
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-5 mt-4">
			<div style="width: 900px; height: 900px;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
			</div>
	
      </main>
    </div>
  </div>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
            
      /*       let context = document
                .getElementById('myChart')
                .getContext('2d'); */
            
            
            $(function () {
				getWeekJoinCnt();
            });    
                
            function getWeekJoinCnt() {
				let weekCnt = [];
				
                $.ajax({
                    url : "/admin/chart",
                    type : "GET",
                    //data : JSON.stringify(data),
                    dataType : "json",
                    contentType : "application/json",
                    success : function(data){
                       for(let i=0;i<data.length;i++){
                    	   weekCnt.push(data[i]);
                       }
                       
                       new Chart(document.getElementById('myChart'),{
                           type: 'bar', // 차트의 형태
                           data: { // 차트에 들어갈 데이터
                               labels: [
                                   //x 축
                                   '일','월','화','수','목','금','토'
                               ],
                               datasets: [
                                   { //데이터
                                       label: '주차별 가입자수', //차트 제목
                                       //fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                                       backgroundColor: [
                                           //색상
                                           'rgba(255, 99, 132, 0.2)',
                                           'rgba(54, 162, 235, 0.2)',
                                           'rgba(255, 206, 86, 0.2)',
                                           'rgba(75, 192, 192, 0.2)',
                                           'rgba(153, 102, 255, 0.2)',
                                           'rgba(255, 159, 64, 0.2)',
                                           'rgba(255, 99, 132, 0.2)'
                                       ],
                                       borderColor: [
                                           //경계선 색상
                                           'rgba(255, 99, 132, 1)',
                                           'rgba(54, 162, 235, 1)',
                                           'rgba(255, 206, 86, 1)',
                                           'rgba(75, 192, 192, 1)',
                                           'rgba(153, 102, 255, 1)',
                                           'rgba(255, 159, 64, 1)',
                                           'rgba(255, 99, 132, 1)'
                                       ],
                                       borderWidth: 1, //경계선 굵기
                                       data: weekCnt // ajax결과 데이터 값
                                   }
                               ]
                           },
                           options: {
                               scales: {
                                   yAxes: [
                                       {
                                           ticks: {
                                               beginAtZero: true
                                           }
                                       }
                                   ]
                               }
                           }
                       })
                    },
                    error : function(errorThrown){
                     alert(errorThrown.statusText);
                  }
                 });
			}
            
            
            

            
        </script>
    </body>
</html>

</body>
</html>