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
          <h1 class="h2">회원관리</h1>
        </div>

        <section class="member_container">
          <article class="member_content member_size pageBody">
            <div class="d-flex comment_title tbl_caption">
              <div class="mt-2 mb-4">
                <span>회원수</span>
                <span>${totalCnt}</span>
              </div>
            </div>
  
            <div class="table_content">
              <table class="table">
                <thead>
                <tr>
                  <th class="">아이디</th>
                  <th class="">가입일</th>
                  <th class="">로그인유형</th>
                  <th class="">권한</th>
                  <th class=""></th>
                </tr>
                </thead>
                
                <tbody>
	          	<c:choose>
	       		  <c:when test="${!empty memberList}">
				    <c:forEach items="${memberList}" var="member">
	                  <tr>
	                    <td class="text-center">${member.userId}</td>
	                    <td class="text-center"><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd"/></td>
	                    <td class="text-center">${member.loginType}</td>
	                    <c:if test="${member.userRole eq 'USER'}">
		                    <td class="text-center">회원</td>
	                    </c:if>
	                    <c:if test="${member.userRole eq 'ADMIN'}">
		                    <td class="text-center">관리자</td>
	                    </c:if>
	                    <c:if test="${member.userRole eq 'ALERTER'}">
		                    <td class="text-center">정지회원</td>
	                    </c:if>
	                    <td class="text-center">
	                      <a href="/admin/member/info/${member.userSeq}">
	                        <i class="bi bi-box-arrow-up-right"></i>
	                      </a>
	                    </td>
	                  </tr>
				    </c:forEach>
		          </c:when>       
	     	    </c:choose>
                </tbody>
                
              </table>
            </div>
          </article>
        </section>

      </main>
    </div>
  </div>
</body>
</html>