<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  .qna_content{
    /* background-color: aqua; */
    position: relative;
    height: 100%;
  }

  #qna_write{
    position: relative;
    top: 20px;
    left: 100px;
    width: 600px;
    /* background-color: bisque; */
  }

  #qna_title{
    font-weight: bold;
    font-size: 17px;
  }

  #qna_title span{
    position: absolute;
    font-weight: 100;
    right: 10px;
  }

  #qna_detail{
    position: absolute;
    border-top: solid rgba(128, 128, 128, 0.432);
    border-bottom: solid rgba(128, 128, 128, 0.432);
    height: 250px;
  }

  .qna_list_mv{
    display: flex;
    position: absolute;
    bottom: 600px;
    left: 100px;
    /* background-color: darkkhaki; */
    padding-top: -20px;
  }
  #qna_mv{
    /* background-color: antiquewhite; */
    width: 500px;
    color: gray;
  }
  #qna_mv div{
    margin-bottom: 10px;
  }

  #qna_mv div span {
    padding: 20px;
  }

  #qna_info_btn{
    margin-left: 40px;
  }

</style>

<title>1:1문의사항/질문</title>
</head>

<body>
  <div class="wrap">
  
  	<jsp:include page="../fix/header.jsp"></jsp:include>
	<!-- 회원만 열람 가능 -->
	<script src="/resources/js/login_check.js"></script>

    <h2>마이페이지</h2>
    <div id="mypage" class="d-flex justify-content-start">
	  <jsp:include page="../fix/aside.jsp"></jsp:include>

      <section class="mypage_content">
        <article class="qna_content">
          <div id="qna_write">
            <div>
              <p id="qna_title">입양 절차 문의드립니다. <span>2023-01-02</span></p>
            </div>
            <div id="qna_detail">
              <p>
                <br>
                할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라
                장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴?
                <br>
              </p>
              </div>
          </div>

          <div class="qna_list_mv">
            <div id="qna_mv">
              <div>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
                </svg>
                <span>다음글&nbsp;&nbsp; 닉네임 수정이 안됩니다.</span>
              </div>
              <div>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                </svg>
                <span>이전글&nbsp;&nbsp; 없음</span>
              </div>
            </div>

            <div id="qna_info_btn">
              <!-- <button class="btn btn-secondary"><a href="">목록</a></button> -->
              <button  class="btn btn-secondary">삭제</button>
            </div>
          </div>
        </article>
      </section>
    </div>
    
    <jsp:include page="../fix/footer.jsp"></jsp:include>
    
</div>

</body>
</html>