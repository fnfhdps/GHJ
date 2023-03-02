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
<!-- qna form css -->
<link rel="stylesheet" href="/resources/css/cs_form.css">

<title>관리자: 후원상품관리</title>
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
          <h1 class="h2">상품등록</h1>
        </div>

        <section class="member_container notice_container">
          <div class="css-mieii2 e1yarwt10">
            <form action="/admin/sponsor/item/update" method="post" enctype="multipart/form-data">
           	  <input type="hidden" value="${sponsorItem.sponsorItemSeq}" name="sponsorItemSeq">
            
              <div class="css-lkffw3 e1yarwt9">
                <div width="343" class="css-1v6bcwv e1yarwt7"></div>
              </div>
              <div class="css-lkffw3 e1yarwt9">
                <div width="343" class="css-1v6bcwv e1yarwt7">
                  <input class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" value="${sponsorItem.sponsorItemCode}" name="sponsorItemCode" placeholder="상품코드">
                </div>
              </div>
              <div class="css-lkffw3 e1yarwt9">
                <div width="343" class="css-1v6bcwv e1yarwt7">
                  <input class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" value="${sponsorItem.sponsorItemName}" name="sponsorItemName" placeholder="상품명">
                </div>
              </div>
              <div class="css-lkffw3 e1yarwt9">
                <div width="343" class="css-1v6bcwv e1yarwt7">
                  <input type="number" class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" value="${sponsorItem.sponsorItemPrice}" name="sponsorItemPrice" placeholder="가격">
                </div>
              </div>

              <div class="css-lkffw3 e1yarwt9">
                <div width="343" class="css-1v6bcwv e1yarwt7">
                    <input type="hidden" id="state1" value="${sponsorItem.sponsorItemState}">
		            <select class="_3ASDR _1qwAY css-1dwz3w6 e1yarwt6" id="state2" name="sponsorItemState">
		              <option value="" selected>-- 선택 --</option>
		              <option value="1">판매중</option>
		              <option value="2">일시품절</option>
		              <option value="3">판매중지</option>
		            </select>
                </div>
              </div>
              <div class="css-lkffw3 e1yarwt9">
                <div width="343" class="css-1v6bcwv e1yarwt7">
                  <img id="img_read" alt="상품사진" src="/resources/image/sponsor/${sponsorItem.sponsorItemImg}" style="width: 200px; height: 200px;">                  
                </div>
              </div>

              <div class="css-lkffw3 e1yarwt9">
                <label class="css-6lgku7 e12vmj862">
                  <span class="css-94jutt e12vmj860">이미지 첨부</span>
                  <input type="file" name="sponsorFile" accept="image/*" onchange="readURL(this);" hidden="">
                </label>
              </div>
              
              <div class="css-1bkpu5b e1yarwt5">
                <button class="_1eWD8 _3SroY _27do9 css-1pz165y e1yarwt0" type="submit">제출하기</button>
              </div>
            </form>
          </div>
        </section>
        
      </main>
    </div>
  </div>
<!-- 이미지 미리보기 js -->
<script src="/resources/js/readURL.js"></script>
<script type="text/javascript">
	const state = $("#state1").val();
	if(state == 1){
		$("#state2").val('1').prop("selected",true);
	} else if(state == 2){
		$("#state2").val('2').prop("selected",true);
	} else{
		$("#state2").val('3').prop("selected",true);
	}
</script>
</body>
</html>