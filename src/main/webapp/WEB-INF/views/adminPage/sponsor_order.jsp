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

<title>관리자: 주문관리</title>
</head>

<!-- 관리자 role인지 확인하기 -->
<body>
  <div class="main_content d-flex">
    <!-- 관리자페이지 목록 -->
    <jsp:include page="../fix/admin_nav.jsp"></jsp:include>
    
    <div>
      <header>
        <div class="head_content py-3">
          <div class="container-fluid align-items-center" style="grid-template-columns: 1fr 2fr;">
            <div class="d-flex align-items-center">
              <div class="w-50 fw-bold m-1">
                <span class="head_text">게시글 관리</span>
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
        <article class="sponsor_art2 member_content member_size pageBody">
          <div class="mb-4">
            <input class="form-control" type="text" placeholder="작성자, 내용 검색" type="text" name="" id="">
          </div>

          <div class="comment_title">
            <span>전체 주문수</span>
            <span>35</span>
          </div>

          <div class="table_content">
            <table class="table">
              <thead>
                <th>주문번호</th>
                <th class="">주문자</th>
                <th class="">상품명</th>
                <th class="">갯수</th>
                <th class="">결제금액</th>
                <th class="">결제일시</th>
                <th class="">주문상태</th>
              </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-center">3</td>
                  <td class="text-center">김지수</td>
                  <td class="text-center">말콤!에코백</td>
                  <td class="text-center">2</td>
                  <td class="text-center">30000</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">배송대기중</td>
                </tr>
                
                <tr>
                  <td class="text-center">3</td>
                  <td class="text-center">김지수</td>
                  <td class="text-center">말콤!에코백</td>
                  <td class="text-center">2</td>
                  <td class="text-center">30000</td>
                  <td class="text-center">신용카드</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">배송대기중</td>
                </tr>

                <tr>
                  <td class="text-center">3</td>
                  <td class="text-center">김지수</td>
                  <td class="text-center">말콤!에코백</td>
                  <td class="text-center">2</td>
                  <td class="text-center">30000</td>
                  <td class="text-center">신용카드</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">배송대기중</td>
                </tr>

                <tr>
                  <td class="text-center">3</td>
                  <td class="text-center">김지수</td>
                  <td class="text-center">말콤!에코백</td>
                  <td class="text-center">2</td>
                  <td class="text-center">30000</td>
                  <td class="text-center">신용카드</td>
                  <td class="text-center">2022-12-23</td>
                  <td class="text-center">배송대기중</td>
                </tr>
              </tbody>
            </table>
        </div>
      </article>

      <article class="sponsor_art member_content member_size pageBody css-y8viq9 ezu2kv83">
        <div class="css-py8xgp ezu2kv82">
          <div>배송지 정보</div>
        </div>
        <div class="css-1h47j8n ezu2kv80">
          <div class="css-zjik7 eukl7io4">
            <div class="css-17fh4sh eukl7io3">
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">받는 사람</div>
                <div class="css-cqduba e1fwbpos0">홍길동</div>
              </div>
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">연락처</div>
                <div class="css-cqduba e1fwbpos0">010-2222-3444</div>
              </div>
                <div class="css-k8dhob e1fwbpos2">
                  <div class="css-xlcpif e1fwbpos1">주소</div>
                  <div class="css-cqduba e1fwbpos0"> 제주특별자치도 서귀포 어딘가</div>
                </div>
                <div class="css-k8dhob e1fwbpos2">
                  <div class="css-xlcpif e1fwbpos1">배송메모</div>
                  <div class="css-cqduba e1fwbpos0">부재시 문앞에 놓아주세요</div>
                </div>
              </div>
            </div>
          </div>
      </article>

      <article class="sponsor_art member_content member_size pageBody  css-y8viq9 ezu2kv83">
        <div class="css-py8xgp ezu2kv82">
          <div>결제정보</div>
        </div>
        <div class="css-1h47j8n ezu2kv80">
          <div class="css-vqaf4p ekrx5n62">
            <div class="css-17fh4sh ekrx5n61">
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">상품금액</div>
                <div class="css-17qztlv e1fwbpos0">33,900원</div>
              </div>
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">배송비</div>
                <div class="css-17qztlv e1fwbpos0">(+) 0원</div>
              </div>
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">결제금액</div>
                <div class="css-17qztlv e1fwbpos0">30000원</div>
              </div>
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">결제방법</div>
                <div class="css-17qztlv e1fwbpos0">네이버페이</div>
              </div>
            </div>
            <div class="css-17fh4sh ekrx5n61">
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">주문자</div>
                <div class="css-17qztlv e1fwbpos0">김지수</div>
              </div>
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">연락처</div>
                <div class="css-17qztlv e1fwbpos0">010-1111-2222</div>
              </div>
              <div class="css-k8dhob e1fwbpos2">
                <div class="css-xlcpif e1fwbpos1">이메일</div>
                <div class="css-17qztlv e1fwbpos0">sffdg12@naver.com</div>
              </div>
            </div>
          </div>
        </div>
      </article>
      </section>

    </div>
  </div>
</body>
</html>