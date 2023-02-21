/**
 * adopt_dtail에 들어가는 ajax, jquery 모음
 */

// input을 공백으로 넘기면 null이 아니라 0으로 인식됨
	const category = $('#boardCategory').val();
	const boardSeq = $('#boardSeq').val();
	const userSeq2 = $('#userSeq').val();
	const detailUserSeq = $('#detailUserSeq').val();
	   
	let successPath = "/adopt/detail/"+category+"/"+boardSeq+"/"+userSeq2;
	
	// ajax 사용시 이동 url, alert에 들어갈 msg
	let url = "";
	let msg1 = "";
	let msg2 = "통신오류";
	let data = "";
	
	// 글 작성자한테는 상태변경, 수정, 삭제 버튼 / 다른 사람한테는 좋아요, 신고, 신청 보이기
	if(userSeq2 == detailUserSeq){
		$("#hopeCheck").css('display', 'none');
		$("#heart").css('display', 'none');
		$("#blame").css('display', 'none');
	}else{
		$("#stateupdate").css('display', 'none');
		$("#update").css('display', 'none');
		$("#delete").css('display', 'none');
	}
	
	// 중복 ajax 함수로 만듦
    function ajaxPost(url, data, msg1, msg2) {
        $.ajax({
            url : url,
            type :'post',
            data : JSON.stringify(data),
            dataType : "json",
            contentType : "application/json",
            async : true,
            success : function(result){
                if(result == 0){
                	if(msg1 != ""){
                		alert(msg1);                		
                	}
	                window.location.href = successPath;
                } else {
                	alert(msg2);
                	return;
                }
            },
            error : function(errorThrown){
             alert(errorThrown.statusText);
          }
         });
	}
    
	// 신고 하기
	/* 		function checkBlame() {
	    let popOption = "width=650px, height=550px, top-300px, left=300px, scrollbars=yes";
	        blaContentUrl = "/adopt/insert/blaContent/"+boardSeq+"/"+userSeq2;
	    	window.open(blaContentUrl, 'insertBlame', popOption);
	    	};
	 */
    // 신고 조회
	function checkBlame() {
	    // 신고가 있는지 확인한 값을 blameval에 저장
	    const blameval = $('#blame').val();
	    const blameCnt = $('#blameCnt').val();
	    
	    //alert(blameval + blameCnt);
	    
	    /* data = {"boardSeq" : boardSeq , "res_userSeq" : detailUserSeq}; */
	    
	    if(blameCnt == 0) {
	    	
	        window.location.href = "/adopt/insert/blaContent/"+boardSeq+"/"+detailUserSeq+"/"+userSeq2;
			
	    } else {
	    	alert("이미 신고 하였습니다");
	    }
	};

	// 좋아요 아이콘
	const heartCnt = $('#heartCnt').val();
	if(heartCnt == 1){
		$("#heartIcon").attr("class", "bi-heart-fill").css( "color", "red" );
	}else{
		$("#heartIcon").attr("class", "bi bi-heart");
	}
	
	// 좋아요 중복 체크
	function checkHeart() {
	    // 좋아요가 있는지 확인한 값을 heartval에 저장
	    data = {"userSeq" : userSeq2, "boardSeq" : boardSeq};
	    
	    // heartval이 1이면 좋아요가 이미 되있는것이므로 deleteHeart 출력하는 코드
	    if(heartCnt == 1) {
	    	url = "/adopt/delete/heart";
	    } else {
	    	url = "/adopt/insert/heart";
	    }
	    ajaxPost(url, data, msg1, msg2);
	};

	// 입양 수정 페이지 이동
	function adoptUpdate() {
	 	window.location.href = '/adopt/update';
	};

	// 입양 삭제
	function adoptDelete() {
		if(window.confirm("삭제 하시겠습니까?")){
//			data = {"boardSeq" : boardSeq};
//			url = "/adopt/delete";
//			msg1 = "삭제 되었습니다"
//		    ajaxPost(url, data, msg1, msg2);
			location.href = '/adopt/delete/'+boardSeq;
		}
	};

	// 입양 신청 중복체크
	function checkSubmit(){
		data = {"userSeq": userSeq2, "boardSeq":boardSeq};
		//url = "/adopt/hope/check";
		//msg1 = "신청 완료";

		$.ajax({
			url: "/adopt/hope/check",
			type: "post",
			data: JSON.stringify(data),
			dataType: "json",
			contentType: "application/json",
			success: function(result){
				if(result == 0) {
					alert("신청 완료")
					$("#adopt_form").submit();
				} else if(result == 1){
					alert("이미 신청한 글입니다.");
					return;
				} else if(result == 9) {
					alert("통신 오류");
					return;
				}
			},
			error : function(errorThrown){
				alert(errorThrown.statusText);
			}
		});
	};

	// 입양 상태 변경
	function stateUpdate(){
		const beforeState = $('#state').text();
		let num = 0;
		
		//alert(beforeState + boardSeq);
		
		if (beforeState == 'WAIT') {
			num = 1;
		} else if (beforeState == 'SUCCESS') {
			num = 2;
		}
		
		data = {"boardSeq" : boardSeq};
		url = "/adopt/detail/state/"+num;
		msg1 = "상태 변경 완료";
		
		ajaxPost(url, data, msg1, msg2);
	};
	
	  //이전글, 다음글
	data = {
			"boardSeq" : boardSeq,
			"boardCategory" : category,
			"userSeq" : userSeq2
	};
	//alert("boardSeq:"+boardSeq+"boardCategory:"+category+"userSeq: "+userSeq2);
	
	// 이전글
	$.ajax({
		url: "/before",
		type: "get",
		data: data,
		dataType: "text",
		async: true,
		success: function(result){
			if(result.findSeq == 0) {
				$("#before").text("글이 없습니다").css("color", "gray");
			} else if(result == -1) {
				alert("통신 오류");
				return;
			} else {
				let beforeSeq = result.findSeq;
				let beforeTitle = result.findTitle;
				//alert("beforeSeq: "+beforeSeq+", beforeTitle:"+beforeTitle);
				$("#before").attr("href", "/adopt/detail/"+category+"/"+beforeSeq+"/"+userSeq2);
				$("#before").text(beforeTitle);
				};
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		},
		dataType: "json"
	});
	
	// 다음글 조회
	$.ajax({
		url: "/after",
		type: "get",
		data: data,
		dataType: "text",
		async: true,
		success: function(result){
			if(result.findSeq == 0) {
				$("#after").text("글이 없습니다").css("color", "gray");
			} else if(result == -1) {
				alert("통신 오류");
				return;
			} else {
				let afterSeq = result.findSeq;
				let afterTitle = result.findTitle;
				//alert("afterSeq: "+afterSeq+", afterTitle:"+afterTitle);
				$("#after").attr("href", "/adopt/detail/"+category+"/"+afterSeq+"/"+userSeq2);
				$("#after").text(afterTitle);
			}
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		},
		dataType: "json"
	});	
