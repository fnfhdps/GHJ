<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- 구글 폰트 적용 -->
<link href="https://fonts.googleapis.com">
<link href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- adminPage css -->
<link rel="stylesheet" href="/resources/css/adminpage.css">
<link rel="stylesheet" href="/resources/css/adminpage2.css">

<title>관리자 header</title>
</head>
<body>
  <input id="adminSeq" type="hidden" value="${login.userSeq}">
  <input id="adminRole" type="hidden" value="${login.userRole}">
  
	<!-- 로그인 및 관리자 권한 유무 확인  -->
	<script type="text/javascript">
		const adminSeq = $("#adminSeq").val();
		const adminRole = $("#adminRole").val();
		
		if (adminRole != 'ADMIN') {
			alert("접근 권한이 없습니다.");
			window.location.href = "/index";
		}
	</script>

  <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a id="nav_a" class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="/index">구해줘!펫즈</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <!-- <input class="form-control form-control-dark w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search"> -->
    <div class="navbar-nav">
      <div class="nav-item text-nowrap">
        <a class="nav-link px-3" href="/logout">Sign out</a>
      </div>
    </div>
  </header>
</body>
</html>