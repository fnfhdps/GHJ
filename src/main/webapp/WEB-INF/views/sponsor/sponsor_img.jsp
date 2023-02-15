<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 공동 링크 모음 -->
<jsp:include page="../fix/link.jsp"></jsp:include>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

h1, h2, p {
	font-family: 'Noto Sans KR', sans-serif;
}

h1 {
	font-size: 35px bold;
}

h2 {
	font-size: 22px bold;
}

p {
	font-size: 17px;
}

</style>

<title>후원 안내</title>
</head>
<body>
	<div class="wrap container">

		<jsp:include page="../fix/header.jsp"></jsp:include>
		
		<!-- 후원 main 이미지 -->
		<div class="row">
			<a href="/sponsor/get">
				<img id="id_map_img" class="col" alt="후원" src="/resources/image/sponsor/sponsorMain.jpg" usemap="#sponsor">
			</a>
 		</div>
		
		<jsp:include page="../fix/footer.jsp"></jsp:include>
	</div>
		
	
    <script type="text/javascript">
        $(function(){
            $('#id_map_img').rwdImageMaps();
        });
    </script>
</body>
</html>