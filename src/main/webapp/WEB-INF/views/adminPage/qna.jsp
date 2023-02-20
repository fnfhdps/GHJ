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

<title>관리자: 1:1문의관리</title>
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
                <span class="head_text">1:1문의 관리</span>
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
            <input class="form-control" type="text" placeholder="작성자, 내용 검색" type="text" name="" id="">
          </div>

          <div class="comment_title">
            <span>게시물</span>
            <span>35</span>
          </div>

          <div class="table_content">
            <table class="table">
              <thead>
              <tr>
                <th class=""><input type="checkbox" name="" id=""></th>
                <th class="">번호</th>
                <th class="">제목</th>
                <th class="">작성자</th>
                <th class="">작성일</th>
                <th class="">상태</th>
                <th class=""></th>
              </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-center">
                    <input type="checkbox" name="" id="">
                  </td>
                  <td class="text-center">4</td>
                  <td class="text-center">환불 원츄</td>
                  <td class="text-center">dfg@naver.com</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">답변대기</td>
                  <td class="text-center">
                    <a href="#">
                      <i class="bi bi-chat-fill"></i>
                    </a>
                  </td>
                </tr>

                <tr>
                  <td class="text-center">
                    <input type="checkbox" name="" id="">
                  </td>
                  <td class="text-center">3</td>
                  <td class="text-center">환불 원츄</td>
                  <td class="text-center">dfg@naver.com</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">답변완료</td>
                  <td class="text-center">
                    <a href="#">
                      <i class="bi bi-chat-fill"></i>
                    </a>
                  </td>
                </tr>

                <tr>
                  <td class="text-center">
                    <input type="checkbox" name="" id="">
                  </td>
                  <td class="text-center">2</td>
                  <td class="text-center">환불 원츄</td>
                  <td class="text-center">dfg@naver.com</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">답변완료</td>
                  <td class="text-center">
                    <a href="#">
                      <i class="bi bi-chat-fill"></i>
                    </a>
                  </td>
                </tr>

                <tr>
                  <td class="text-center">
                    <input type="checkbox" name="" id="">
                  </td>
                  <td class="text-center">1</td>
                  <td class="text-center">환불 원츄</td>
                  <td class="text-center">dfg@naver.com</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">답변완료</td>
                  <td class="text-center">
                    <a href="#">
                      <i class="bi bi-chat-fill"></i>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
        </div>

        <div class="notice_btn d-flex justify-content-end">
          <a href="#" type="button" class="btn btnAuthentication">선택 삭제</a>
        </div>

        </article>
      </section>

    </div>
  </div>
</body>
</html>