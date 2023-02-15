/**
 * 입양댓글 js
 */

	// 댓글 관련 js
	let replyContent = "";
	//let replySeq = "";
	
	// 댓글 입력
	function replyInsert() {
		replyContent = $("#insert_content").val();
		if(replyContent == 0){
			alert("댓글을 입력해 주세요");
		}else{
			//alert("reply_insert시작 replyContent : " + replyContent);
			
			data = {
					"userSeq" : userSeq2,
					"boardSeq" : boardSeq,
					"replyContent" : replyContent
					};
			url = "/reply/insert";
			//msg1 = "댓글 입력 완료";
			
			ajaxPost(url, data, msg1, msg2);	
		}
	};
	
	// 테스트용
	function test(replySeq, content) {
		alert("seq: "+ replySeq + "content: "+ content);
	}
	
	
	$(".update_content").css("display", "none");
	$(".update_btn").click(function() {
		$("#show_content").css("display", "none");
		$(".update_content").css("display", "block");		
	});

	// 댓글 수정
	function replyUpdate(replySeq, contentId) {
		replyContent = $(contentId).val();
		//alert("replySeq: "+ replySeq + "replyContent: "+ replyContent);
		
		data = {
				"replySeq" : replySeq,
				"replyContent" : replyContent
				};
		url = "/reply/update";
		//msg1 = "댓글 수정 완료";
		
		//ajaxPost(url, data, msg1, msg2);
		
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
	};

	
	// 댓글 삭제
	function replyDelete(replySeq) {
		alert("replySeq : " + replySeq);
		
		data = {"replySeq" : replySeq};
		url = "/reply/delete";
		msg1 = "삭제 되었습니다";
		
		//ajaxPost(url, data, msg1, msg2);
		
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
	};