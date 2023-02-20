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

<title>관리자: 회원상세조회</title>
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
          <h1 class="h2">회원정보상세</h1>
        </div>

        <section class="member_container">
          <div class="d-flex pageBody">
            <a href="#"><i class="bi bi-arrow-left-short arrow-text"></i></a>
            <small class="ms-2 mt-1 text-center arrow-text">김지수</small>
          </div>
  
          <div class="row art_content">
            <!-- 회원정보 -->
            <article class="art1 col-lg-6 member_content member_mg">
              <form class="pageBody art_border">
                <div>
                  <h3>회원정보</h3>
                </div>
                <div class="my-4 d-flex flex-column">
                  <img src="../img/dog.jpg" alt="">
                  <span>김지수</span>
                </div>
  
                <div class="form_info">
                  <div class="mb-3 formGroup">
                    <label class="mb-2">권한</label>
                    <select class="form-select" aria-label="Default select example">
                      <option value="1">회원</option>
                      <option value="2">관리자</option>
                      <option value="3">정지</option>
                    </select>
                  </div>
  
                  <div class="mb-3 formGroup">
                    <label class="mb-2">계정</label>
                    <input class="form-control" type="password" placeholder="이메일">
                  </div>
                  <div class="mb-3 formGroup">
                    <label class="mb-2">비밀번호</label>
                    <input class="form-control" type="password" placeholder="이메일">
                  </div>
                  <div class="mb-3 formGroup">
                    <label class="mb-2">핸드폰번호</label>
                    <input class="form-control" type="password" placeholder="이메일">
                  </div>
                  <div class="mb-3 formGroup">
                    <label class="mb-2">주소지</label>
                    <input class="form-control" type="password" placeholder="이메일">
                  </div>
                </div>
                <div class="mt-4 formRow">
                  <button class="col-12 btn btn-secondary" type="button">저장</button>
                </div>
              </form>
              <div class="pageBody"></div>
            </article>
  
            <div class="art2 col col-lg-6 member_content member_mg">
              <article class="art_sub1 pageBody art_border">
                <div class="art2_text">
                  <h3>활동정보</h3>
                </div>
                <div class="art2_text">
                  <div>
                    <small>가입일</small>
                    <p class="mt-1">2021-03-24 14:23:02</p>
                  </div>
                  <div>
                    <small>최근접속일</small>
                    <p class="mt-1">2021-03-24 14:23:02</p>
                  </div>
  
                  <div>
                    <small>작성</small>
                    <table class="mt-1">
                      <tr>
                        <td>게시글</td>
                        <td class="ps-4">0개</td>
                      </tr>
                      <tr>
                        <td>댓글</td>
                        <td class="ps-4">4개</td>
                      </tr>
                      <tr>
                        <td>후원</td>
                        <td class="ps-4">3개</td>
                      </tr>
                      <tr>
                        <td>문의</td>
                        <td class="ps-4">2개</td>
                      </tr>
                      <tr>
                        <td>신고</td>
                        <td class="ps-4">0개</td>
                      </tr>
                    </table>
                  </div>
                </div>
              </article>
  
              <!-- 해당 회원의 작성글?정보? 뭐써야하지 -->
              <article class="art_sub2 member_content pageBody art_border">
                <div class="art2_text">
                  <h3>작성게시글</h3>
                </div>
  
                <div class="">
                  <table class="table">
                    <thead>
                    <tr>
                      <th class="">프로필</th>
                      <th class="">아이디</th>
                      <th class="">가입일</th>
                      <th class="">신고횟수</th>
                    </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="text-center">회원사진1</td>
                        <td class="text-center">sdbf1356</td>
                        <td class="text-center">2022-12-23</td>
                        <td class="text-center">12</td>
                      </tr>
                      <tr>
                        <td class="text-center">회원사진1</td>
                        <td class="text-center">sdbf1356</td>
                        <td class="text-center">2022-12-23</td>
                        <td class="text-center">12</td>
                      </tr>
                      <tr>
                        <td class="text-center">회원사진1</td>
                        <td class="text-center">sdbf1356</td>
                        <td class="text-center">2022-12-23</td>
                        <td class="text-center">12</td>
                      </tr>
                    </tbody>
                  </table>
              </div>
  
              </article>
            </div>
          </div>
        </section>

        <!-- 임시
        <h2>Section title</h2>
        <div class="table-responsive">
          <table class="table table-striped table-sm">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Header</th>
                <th scope="col">Header</th>
                <th scope="col">Header</th>
                <th scope="col">Header</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1,001</td>
                <td>random</td>
                <td>data</td>
                <td>placeholder</td>
                <td>text</td>
              </tr>
              <tr>
                <td>1,002</td>
                <td>placeholder</td>
                <td>irrelevant</td>
                <td>visual</td>
                <td>layout</td>
              </tr>
            </tbody>
          </table>
        </div> -->

      </main>
    </div>
  </div>
</body>
</html>