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
		  <div class="d-flex justify-content-between">
	          <div class="d-flex pageBody">
	            <a href="/admin/member"><i class="bi bi-arrow-left-short arrow-text"></i></a>
	            <small class="ms-2 mt-1 text-center arrow-text">${member.userName}</small>
	          </div>
	          <div class="pageBody">
	            <a onclick="memberDelete();">
	            	<small class="arrow-text">계정삭제</small>
	            </a>
	          </div>		  
		  </div>
  
          <div class="row art_content">
            <!-- 회원정보 -->
            <article class="art1 col-lg-6 member_content member_mg">
              <form class="pageBody art_border" action="/admin/member/update" method="post">
                <div>
                  <h3>회원정보</h3>
                </div>
                <input type="hidden" value="${member.userSeq}" name="userSeq">
                
                <div class="my-4 d-flex flex-column">
                  <img alt="" src="${member.userImg}">
                  <input type="file" accept="image/*" name="userImg">
                </div>
  
                <div class="form_info">  
                  <div class="mb-3 formGroup">
                    <label class="mb-2">권한</label>
                    <select class="form-select" name="userRole">
                      <option value="USER">회원</option>
                      <option value="ADMIN">관리자</option>
                      <option value="ALERTER">정지</option>
                    </select>
                  </div>
                  
                   <div class="mb-3 formGroup">
                    <label class="mb-2">아아디</label>
                    <input class="form-control" id="memberId" type="text" value="${member.userId}" disabled="disabled">
                  </div>
                  <div class="mb-3 formGroup">
                    <label class="mb-2">비밀번호</label>
                    <input class="form-control" type="text" value="${member.userPw}">
                  </div>
                  <div class="mb-3 formGroup">
                    <label class="mb-2">핸드폰번호</label>
                    <input class="form-control" type="text" name="userPhone" value="${member.userPhone}">
                  </div>
                  <div class="mb-3 formGroup">
                    <label class="mb-2">이메일</label>
                    <input class="form-control" type="text" name="userEmail" value="${member.userEmail}">
                  </div>
                  <div class="mb-3 formGroup">
                    <label class="mb-2">주소지</label>
                    <input class="form-control mb-2" type="text" name="userAddr1" value="${member.userAddr1}">
                    <input class="form-control mb-2" type="text" name="userAddr2" value="${member.userAddr2}">
                    <input class="form-control mb-2" type="text" name="userAddr3" value="${member.userAddr3}">
                  </div>
                </div>
                <div class="mt-4 formRow">
                  <button class="col-12 btn btn-secondary" type="submit">저장</button>
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
                    <p class="mt-1"><fmt:formatDate value="${member.regDate}" pattern="yyyy.MM.dd HH:mm:ss"/></p>
                  </div>
                  <div>
                    <small>최근접속일</small>
                    <p class="mt-1">${member.lastDate}</p>
                  </div>
  
                  <div>
                    <small>작성</small>
                    <table class="mt-1">
                      <tr>
                        <td>게시글</td>
                        <td class="ps-4">${totalCnt.adopt}개</td>
                      </tr>
                      <tr>
                        <td>댓글</td>
                        <td class="ps-4">${totalCnt.reply}개</td>
                      </tr>
                      <tr>
                        <td>후원</td>
                        <td class="ps-4">${totalCnt.sponsor}개</td>
                      </tr>
                      <tr>
                        <td>문의</td>
                        <td class="ps-4">${totalCnt.qna}개</td>
                      </tr>
                      <tr>
                        <td>신고</td>
                        <td class="ps-4">${totalCnt.blame}개</td>
                      </tr>
                    </table>
                  </div>
                </div>
              </article>
  
              <!-- 해당 회원의 작성글?정보? 뭐써야하지 -->
<!--               <article class="art_sub2 member_content pageBody art_border">
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
  
              </article> -->
            </div>
          </div>
        </section>

      </main>
    </div>
  </div>
  
<script type="text/javascript">
	const memberId = $("#memberId").val();

	function memberDelete() {
		const data = {"userId" : memberId}
		
		if(window.confirm("삭제 하시겠습니까?")){
	        $.ajax({
	            url : "/admin/member/delete",
	            type :'post',
	            data : JSON.stringify(data),
	            dataType : "json",
	            contentType : "application/json",
	            async : true,
	            success : function(result){
	                if(result == 0){
		                window.location.href = "/admin/member";
	                } else {
	                	alert("실패");
	                	return;
	                }
	            },
	            error : function(errorThrown){
	             alert(errorThrown.statusText);
	          }
	         });
		}
	}

</script> 
</body>
</html>