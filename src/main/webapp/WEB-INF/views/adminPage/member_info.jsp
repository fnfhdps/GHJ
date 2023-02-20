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

  <div class="main_content d-flex flex-nowrap">
    <!-- 관리자페이지 목록 -->
    <jsp:include page="../fix/admin_nav.jsp"></jsp:include>

    <div class="section2 d-flex flex-column justify-content-start">
      <header>
        <div class="head_content py-3">
          <div class="container-fluid align-items-center" style="grid-template-columns: 1fr 2fr;">
            <div class="d-flex align-items-center">
              <div class="w-50 fw-bold m-1">
                <span class="head_text">회원 관리</span>
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
        <div class="d-flex pageBody">
          <a href="#"><i class="bi bi-arrow-left-short"></i></a>
          <small class="ms-2 text-center">김지수</small>
        </div>

        <div class="row art_content pageBody">
          <!-- 회원정보 -->
          <article class="art1 col-xxl-6 member_content member_mg pageBody">
            <form class="my-3 mx-3">
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
          </article>

          <div class="art2 col col-xxl-6 member_content member_mg">
            <article class="art_sub1 col pageBody">
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
            <article class="art_sub2 col member_content pageBody">
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
                    <th class=""></th>
                  </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-center">회원사진1</td>
                      <td class="text-center">sdbf1356</td>
                      <td class="text-center">2022-12-23</td>
                      <td class="text-center">12</td>
                      <td class="text-center dropdown">
                            <i class="bi bi-three-dots-vertical" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"></i>
                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="#">조회</a></li>
                            <li><a class="dropdown-item" href="#">삭제</a></li>
                          </ul>
                      </td>
                    </tr>
                    <tr>
                      <td class="text-center">회원사진1</td>
                      <td class="text-center">sdbf1356</td>
                      <td class="text-center">2022-12-23</td>
                      <td class="text-center">12</td>
                      <td class="text-center dropdown">
                        <i class="bi bi-three-dots-vertical" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"></i>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="#">조회</a></li>
                        <li><a class="dropdown-item" href="#">삭제</a></li>
                      </ul>
                  </td>
                    </tr>
                    <tr>
                      <td class="text-center">회원사진1</td>
                      <td class="text-center">sdbf1356</td>
                      <td class="text-center">2022-12-23</td>
                      <td class="text-center">12</td>
                      <td class="text-center dropdown">
                        <i class="bi bi-three-dots-vertical" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"></i>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="#">조회</a></li>
                        <li><a class="dropdown-item" href="#">삭제</a></li>
                      </ul>
                  </td>
                    </tr>
                    <tr>
                      <td class="text-center">회원사진1</td>
                      <td class="text-center">sdbf1356</td>
                      <td class="text-center">2022-12-23</td>
                      <td class="text-center">12</td>
                      <td class="text-center dropdown">
                        <i class="bi bi-three-dots-vertical" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"></i>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="#">조회</a></li>
                        <li><a class="dropdown-item" href="#">삭제</a></li>
                      </ul>
                  </td>
                    </tr>
                    <tr>
                      <td class="text-center">회원사진1</td>
                      <td class="text-center">sdbf1356</td>
                      <td class="text-center">2022-12-23</td>
                      <td class="text-center">12</td>
                      <td class="text-center dropdown">
                        <i class="bi bi-three-dots-vertical" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"></i>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="#">조회</a></li>
                        <li><a class="dropdown-item" href="#">삭제</a></li>
                      </ul>
                  </td>
                    </tr>
                  </tbody>
                </table>
            </div>

            </article>
          </div>
        </div>
      </section>

    </div>
  </div>


</body>
</html>