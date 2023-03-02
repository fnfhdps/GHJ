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

<!-- cs css -->
<link rel="stylesheet" href="/resources/css/cs.css">
<link rel="stylesheet" href="/resources/css/cs_faq.css">
<title>자주 묻는 질문</title>
</head>

<body>
<div class="wrap">
    <jsp:include page="../fix/header.jsp"></jsp:include>

	<div class="main">
	  <section class="section hero">
	    <div class="hero-inner">
<!-- 	      <form role="search" class="search search-full" data-search="" data-instant="true" autocomplete="off" action="#" method="get">
	        <input name="utf8" type="hidden" value="✓" autocomplete="off">
	        <input type="search" name="query" id="query" placeholder="검색" autocomplete="off" aria-label="검색">
	      </form> -->
	    </div>
	  </section>
	
	  <div class="container">
	    <section class="section knowledge-base">
	      <section class="categories blocks">
	        <ul class="blocks-list">
	              <li class="blocks-item">
	                <a href="/cs/faq" class="blocks-item-link">
	                  <h3 class="blocks-item-title">FAQ</h3>
	                  <!-- <p class="blocks-item-description">회원을 위한 맞춤 상담</p> -->
	                </a>
	              </li>
	
	              <li class="blocks-item">
	                <a href="/cs/notice" class="blocks-item-link">
	                  <h3 class="blocks-item-title">Notice</h3>
	                  <!-- <p class="blocks-item-description">교육 프로그램 관련 문의(운영/결제/환불 등)</p> -->
	                </a>
	              </li>
	        </ul>
	      </section>
	  
	      <!-- 세션으로 값 가져오기  -->
	        <section class="articles">
	          <h2 class="articles-header" style="margin-block-end: 0.9em;">자주 묻는 질문</h2>
	          <ul class="article-list promoted-articles">
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900001497646-%EA%B6%8C%EC%9E%A5-%EC%82%AC%EC%96%91%EC%9D%B4-%EC%96%B4%EB%96%BB%EA%B2%8C-%EB%90%98%EB%82%98%EC%9A%94-">
	                    권장 사양이 어떻게 되나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900004243263-%EC%82%BC%EC%84%B1-%EA%B0%A4%EB%9F%AD%EC%8B%9C-%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%EC%97%90%EC%84%9C-%ED%99%94%EB%A9%B4-%EC%9E%90%EB%8F%99-%EA%BA%BC%EC%A7%90-%EC%9D%84-%EB%81%8C-%EC%88%98-%EC%97%86%EC%8A%B5%EB%8B%88%EB%8B%A4-">
	                    삼성 갤럭시 디바이스에서 '화면 자동 꺼짐'을 끌 수 없습니다.
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/360039062011-%EC%82%AC%EC%9D%B4%EB%8B%9D-%EB%B3%B4%EB%84%88%EC%8A%A4%EB%8A%94-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80%EC%9A%94-">
	                    사이닝 보너스는 무엇인가요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900004042806-%EC%9E%85%EC%82%AC%ED%95%9C-%EC%A7%80-3%EA%B0%9C%EC%9B%94%EC%9D%B4-%EC%A7%80%EB%82%AC%EB%8A%94%EB%8D%B0-%EC%82%AC%EC%9D%B4%EB%8B%9D-%EB%B3%B4%EB%84%88%EC%8A%A4%EA%B0%80-%EC%95%88-%EB%93%A4%EC%96%B4%EC%99%94%EC%8A%B5%EB%8B%88%EB%8B%A4-%EC%82%AC%EC%9D%B4%EB%8B%9D-%EB%B3%B4%EB%84%88%EC%8A%A4%EB%8A%94-%EC%96%B8%EC%A0%9C-%EC%A7%80%EA%B8%89%EB%90%98%EB%82%98%EC%9A%94-">
	                    입사한 지 3개월이 지났는데 사이닝 보너스가 안 들어왔습니다. 사이닝 보너스는 언제 지급되나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900006361183-%EB%8D%B0%EB%B8%8C%EB%A7%A4%EC%B9%AD-%EC%9D%B4%EB%A0%A5%EC%84%9C%EB%A5%BC-%EC%88%98%EC%A0%95%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94-">
	                    데브매칭 이력서를 수정하고 싶어요. 
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900006361063-%EB%8D%B0%EB%B8%8C%EB%A7%A4%EC%B9%AD-%EA%B3%BC%EC%A0%9C%ED%85%8C%EC%8A%A4%ED%8A%B8%EC%9D%98-%EA%B2%B0%EA%B3%BC%EB%A5%BC-%EC%95%8C%EA%B3%A0%EC%8B%B6%EC%96%B4%EC%9A%94-">
	                    데브매칭 과제테스트의 결과를 알고싶어요. 
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/360034546572-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4%EC%9D%98-%EB%AC%B8%EC%A0%9C%EB%A5%BC-%EC%99%B8%EB%B6%80%EC%97%90-%EA%B2%8C%EC%8B%9C%ED%95%A0-%EC%88%98-%EC%9E%88%EB%82%98%EC%9A%94-">
	                    프로그래머스의 문제를 외부에 게시할 수 있나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/360038710012-%EC%8A%A4%ED%82%AC-%EC%B2%B4%ED%81%AC%EB%A5%BC-%EB%8B%A4%EC%8B%9C-%ED%92%80%EA%B3%A0-%EC%8B%B6%EC%8A%B5%EB%8B%88%EB%8B%A4-">
	                    스킬 체크를 다시 풀고 싶습니다.
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/360040615252-%EC%97%B0%EC%8A%B5-%EB%AC%B8%EC%A0%9C%EB%A5%BC-%ED%92%80%EC%97%88%EB%8A%94%EB%8D%B0-%EB%82%B4-%ED%92%80%EC%9D%B4%EA%B0%80-%EB%8B%A4%EB%A5%B8-%EC%82%AC%EB%9E%8C%EC%9D%98-%ED%92%80%EC%9D%B4-%EC%97%90-%EB%82%98%EC%98%A4%EC%A7%80-%EC%95%8A%EC%95%84%EC%9A%94-">
	                    연습 문제를 풀었는데 내 풀이가 [다른 사람의 풀이]에 나오지 않아요.
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/360034929531-%ED%85%8C%EC%8A%A4%ED%8A%B8-%EC%A4%91-%ED%82%A4%EB%B3%B4%EB%93%9C-%EC%9E%85%EB%A0%A5%EC%9D%B4-%EC%95%88-%EB%90%A9%EB%8B%88%EB%8B%A4-">
	                    테스트 중 키보드 입력이 안 됩니다.
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/4407443764249-%EC%88%98%EA%B0%95-%EC%84%A0%EB%B0%9C-%EC%A0%88%EC%B0%A8%EA%B0%80-%EC%96%B4%EB%96%BB%EA%B2%8C-%EB%90%98%EB%82%98%EC%9A%94-">
	                    수강/선발 절차가 어떻게 되나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/4407438070297-%EC%9E%90%EB%B9%84%EB%B6%80%EB%8B%B4%EA%B8%88%EC%9D%B4-%EB%AD%94%EA%B0%80%EC%9A%94-">
	                    자비부담금이 뭔가요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/4407741351193-%EC%9E%90%EB%B9%84%EB%B6%80%EB%8B%B4%EA%B8%88-%EA%B2%B0%EC%A0%9C%EB%8A%94-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%98%EB%82%98%EC%9A%94-">
	                    자비부담금 결제는 어떻게 하나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/4407488633625-%EC%9E%90%EB%B9%84%EB%B6%80%EB%8B%B4%EA%B8%88-%ED%99%98%EA%B8%89%EC%9D%80-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%98%EB%82%98%EC%9A%94-">
	                    자비부담금 환급은 어떻게 하나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/12841489353369-%EB%8D%B0%EB%B8%8C%EC%BD%94%EC%8A%A4-K-%EB%94%94%EC%A7%80%ED%84%B8-%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%8B%9D-%EC%84%A0%EB%B0%9C-%EA%B3%BC%EC%A0%95%EC%9D%B4-%EA%B6%81%EA%B8%88%ED%95%A9%EB%8B%88%EB%8B%A4-">
	                    데브코스:K-디지털 트레이닝 선발 과정이 궁금합니다.
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/4402035462425-%EC%8B%A4%EB%A0%A5-%ED%99%95%EC%9D%B8-%ED%85%8C%EC%8A%A4%ED%8A%B8%EB%8A%94-%EC%96%B4%EB%96%BB%EA%B2%8C-%EC%A7%84%ED%96%89%EB%90%98%EB%82%98%EC%9A%94-">
	                    실력 확인 테스트는 어떻게 진행되나요? 
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/12841414539033-%EA%B5%AD%EB%AF%BC%EB%82%B4%EC%9D%BC%EB%B0%B0%EC%9B%80%EC%B9%B4%EB%93%9C-%EB%B0%9C%EA%B8%89-%EB%B0%8F-HRD-net-%EC%88%98%EA%B0%95%EC%8B%A0%EC%B2%AD%EC%9D%80-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%98%EB%82%98%EC%9A%94-">
	                    국민내일배움카드 발급 및 HRD-net 수강신청은 어떻게 하나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/4402041572889-%EB%82%B4%EC%9D%BC%EB%B0%B0%EC%9B%80%EC%B9%B4%EB%93%9C%EC%97%90-%EC%A7%80%EC%9B%90-%ED%95%9C%EB%8F%84-%EA%B8%88%EC%95%A1%EC%9D%B4-%EC%A7%80%EC%A0%95%EB%90%98%EC%96%B4%EC%9E%88%EB%8D%98%EB%8D%B0-%EC%9D%B4-%EA%B8%88%EC%95%A1%EA%B3%BC-%EC%83%81%EA%B4%80%EC%97%86%EC%9D%B4-%EC%88%98%EA%B0%95-%EC%8B%9C-%EC%B9%B4%EB%93%9C-%EB%B0%9C%EA%B8%89%EB%A7%8C-%EB%90%98%EC%96%B4%EC%9E%88%EC%9C%BC%EB%A9%B4-%EB%90%98%EB%82%98%EC%9A%94-">
	                    내일배움카드에 지원 한도 금액이 지정되어있던데, 이 금액과 상관없이 수강 시 카드 발급만 되어있으면 되나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900005781026-%EB%9D%BC%EC%9D%B4%EB%B8%8C-%EA%B0%95%EC%9D%98%EC%97%90%EC%84%9C-%EC%A7%84%ED%96%89%ED%95%9C-%EB%AF%B8%EC%85%98%EC%9D%B4%EB%82%98-%EC%BD%94%EB%93%9C%EB%A6%AC%EB%B7%B0-%EB%B0%9B%EC%9D%80-%EB%82%B4%EC%9A%A9%EC%9D%84-%EC%99%B8%EB%B6%80%EC%97%90-%EA%B3%B5%EA%B0%9C%ED%95%B4%EB%8F%84-%EB%90%98%EB%82%98%EC%9A%94-">
	                    라이브 강의에서 진행한 미션이나 코드리뷰 받은 내용을 외부에 공개해도 되나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900002126786-%EC%88%98%EB%A3%8C%EC%A6%9D-%EC%9D%B4%EC%88%98%EC%A6%9D%EC%9D%84-%EB%B0%9B%EC%9D%84-%EC%88%98-%EC%9E%88%EB%82%98%EC%9A%94-">
	                    수료증/이수증을 받을 수 있나요?
	  
	                    
	                  </a>
	              </li>
	            
	              <li class="promoted-articles-item">
	                  <a href="/hc/ko/articles/900002128366-%EC%8B%A0%EC%B2%AD%ED%95%9C-%EA%B0%95%EC%9D%98%EB%A5%BC-%ED%99%98%EB%B6%88%EC%9D%84-%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94">
	                    신청한 강의를 환불을 하고 싶어요
	  
	                    
	                  </a>
	              </li>
	            
	          </ul>
	        </section>
	      
	    </section>
	  
	    <section class="section home-section activity">
	      
	    </section>
	  </div>
	</div>

	<jsp:include page="../fix/footer.jsp"></jsp:include>
</div>
</body>
</html>