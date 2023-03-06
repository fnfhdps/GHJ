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
        <div class="chartjs-size-monitor">
          <div class="chartjs-size-monitor-expand">
            <div class=""></div>
          </div>
          <div class="chartjs-size-monitor-shrink">
            <div class=""></div>
          </div>
        </div>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">통계</h1>
        </div>
        
		<section class="member_container">
          <article class="member_content member_size pageBody pb-4">
            <div class="d-flex comment_title tbl_caption">
              <div class="mt-2 mb-3">
                <span>매출 통계</span>
              </div>
            </div>
			<div class="row">
				<div class="col-12 py-3">
					<button class="btn btn-light" id="cnt" type="button">결제건수</button>
					<button class="btn btn-light" id="price" type="button">결제금액</button>
				</div>
				<div class="col-lg-7 col-md-12 col-sm-12">
					<!--차트가 그려질 부분-->
					<canvas id="monthSponsor"></canvas>
				</div>
            <div class="col-lg-3 col-md-12 col-sm-12 ms-5 mt-4">
              <table class="border border-1">
                <tbody class="p-5">
				    <c:forEach items="${totalsponsorState}" var="sponsor">
                  <tr>
                    <td class="p-2 pe-5">${sponsor.SPONSORSTATE}</td>
                    <td class="p-2">${sponsor.CNT}</td>
                  </tr>
					</c:forEach>
                </tbody>
                
              </table>
            </div>

			</div>
          </article>
          <article class="member_content member_size pageBody">
            <div class="d-flex comment_title tbl_caption">
              <div class="mt-2 mb-3">
                <span>최근 가입자 수</span>
              </div>
            </div>
          	<div>
				<div class="col-lg-7 col-md-12 col-sm-12">
					<!--차트가 그려질 부분-->
					<canvas id="weekJoin"></canvas>
				</div>
          	</div>
          </article>
        </section>
        
      </main>
    </div>
  </div>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- 차트 js -->
<script src="/resources/js/chart.js"></script>
</body>
</html>