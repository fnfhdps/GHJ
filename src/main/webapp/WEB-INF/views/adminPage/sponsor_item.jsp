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
          <h1 class="h2">후원상품관리</h1>
        </div>

        <section class="member_container">
          <article class="member_content member_size pageBody">
            <div class="d-flex comment_title tbl_caption">
              <div class="mt-2 mb-4">
                <span>상품수</span>
                <span>${totalCnt}</span>
              </div>
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
                    <th class=""></th>
                  </tr>
                </thead>
                
                <tbody>
	          	<c:choose>
	       		  <c:when test="${!empty sponsorItemList}">
				    <c:forEach items="${sponsorItemList}" var="sponsor">
	                  <tr>
	                    <td class="text-center">${sponsor.num}</td>
	                    <td class="text-center">${sponsor.sponsorItemCode}</td>
	                    <td class="text-center">${sponsor.sponsorItemName}</td>
	                    <td class="text-center">${sponsor.sponsorItemPrice}</td>
	                    <td class="text-center"><fmt:formatDate value="${sponsor.sponsorItemDate}" pattern="yyyy-MM-dd"/></td>
	                    <td class="text-center state1" id="state1">
	                    	<c:if test="${sponsor.sponsorItemState eq '1'}">판매중</c:if>
	                    	<c:if test="${sponsor.sponsorItemState eq '2'}">일시품절</c:if>
	                    	<c:if test="${sponsor.sponsorItemState eq '3'}">판매중지</c:if>
	                    </td>
	                    <td class="text-center dropdown">
	                      <i class="bi bi-three-dots-vertical"
	                          id="dropdownMenuButton1"
	                          data-bs-toggle="dropdown"
	                          aria-expanded="false">
	                      </i>
	                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	                        <li><a class="dropdown-item" href="/admin/sponsor/item/update/${sponsor.sponsorItemSeq}">수정</a></li>
	                        <li><a class="dropdown-item" onclick="itemDelete(${sponsor.sponsorItemSeq});">삭제</a></li>
	                      </ul>
	                    </td>
	                  </tr>
				    </c:forEach>
		          </c:when>    
	     	    </c:choose>
                </tbody>
                
              </table>
            </div>

            <div class="notice_btn d-flex justify-content-end">
              <a href="/admin/sponsor/item/insert" type="button" class="btn btnAuthentication">등록</a>
            </div>
          </article>
        </section>

      </main>
    </div>
  </div>
  
<script type="text/javascript">
function itemDelete(seq) {;
	const data = { "sponsorItemSeq" : seq};
	//alert(seq);
	if(window.confirm("상품을 삭제 하시겠습니까?")){
		$.ajax({
		    url : "/admin/sponsor/item/delete",
		    type :'post',
		    data : JSON.stringify(data),
		    dataType : "json",
		    contentType : "application/json",
		    async : true,
		    success : function(result){
		        if(result == 0){
		            window.location.href = "/admin/sponsor/item";
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