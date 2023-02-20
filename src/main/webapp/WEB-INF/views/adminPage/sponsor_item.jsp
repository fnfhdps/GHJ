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

<title>관리자: 후원상품관리</title>
</head>

<!-- 관리자 role인지 확인하기 -->
<body>
  <div class="main_content d-flex flex-nowrap">
    <!-- 관리자페이지 목록 -->
    <jsp:include page="../fix/admin_nav.jsp"></jsp:include>

    <div class="section2">
      <header>
        <div class="head_content py-3">
          <div class="container-fluid align-items-center" style="grid-template-columns: 1fr 2fr;">
            <div class="d-flex align-items-center">
              <div class="w-50 fw-bold m-1">
                <span class="head_text">상품 관리</span>
              </div>
              <form class="w-100 me-3" role="search">
                <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
              </form>
  
              <div class="flex-shrink-0 dropdown">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small shadow">
                  <li><a class="dropdown-item" href="#">New project...</a></li>
                  <li><a class="dropdown-item" href="#">Settings</a></li>
                  <li><a class="dropdown-item" href="#">Profile</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
              </div>
            </div>
          </div>
      </div>
      </header>

      <section class="member_container align-self-center">
        <article class="member_content member_size pageBody">
          <div class="mb-4">
            <input class="form-control" type="text" placeholder="상품명, 상품코드 검색" type="text" name="" id="">
          </div>

          <div class="comment_title">
            <span>전체 상품</span>
            <span>35</span>
          </div>

          <div class="table_content">
            <table class="table">
              <thead>
              <tr>
                <th class="">번호</th>
                <th class="">상품코드</th>
                <th class="">상품명</th>
                <th class="">가격</th>
                <th class="">등록일</th>
                <th class="">상태</th>
                <th class="">수량</th>
              </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-center">4</td>
                  <td class="text-center">U3ES2FA99S</td>
                  <td class="text-center">멍멍 열쇠고리</td>
                  <td class="text-center">15000</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">판매중</td>
                  <td class="text-center">12</td>
                </tr>

                <tr>
                  <td class="text-center">3</td>
                  <td class="text-center">U3ES2FA99S</td>
                  <td class="text-center">멍멍 열쇠고리</td>
                  <td class="text-center">15000</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">재고없음</td>
                  <td class="text-center">0</td>
                </tr>

                <tr>
                  <td class="text-center">2</td>
                  <td class="text-center">U3ES2FA99S</td>
                  <td class="text-center">멍멍 열쇠고리</td>
                  <td class="text-center">15000</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">판매중</td>
                  <td class="text-center">12</td>
                </tr>

                <tr>
                  <td class="text-center">1</td>
                  <td class="text-center">U3ES2FA99S</td>
                  <td class="text-center">멍멍 열쇠고리</td>
                  <td class="text-center">15000</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">판매종료</td>
                  <td class="text-center">0</td>
                </tr>
              </tbody>
            </table>
        </div>

        <div class="notice_btn d-flex justify-content-end">
          <a href="#" type="button" class="btn btnAuthentication">등록</a>
          <a href="#" type="button" class="btn btnAuthentication">삭제</a>

        </div>

        </article>
      </section>

    </div>
  </div>
</body>
</html>