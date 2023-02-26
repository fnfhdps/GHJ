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
			alert("내용을 입력해 주세요.");
		}else{
			
			data = {
					"userSeq" : userSeq2,
					"boardSeq" : boardSeq,
					"replyContent" : replyContent
					};
			url = "/reply/insert";
			
//	        $.ajax({
//	            url : url,
//	            type : type,
//	            data : JSON.stringify(data),
//	            dataType : "json",
//	            contentType : "application/json",
//	            async : true,
//	            success : function(result){
//	                if(result == 0){
//	                	if(msg1 != ""){
//	                		alert(msg1);                		
//	                	}
//	                	if(successPath != ""){
//	                		window.location.href = successPath;
//	                	}
//	                } else {
//	                	alert(msg2);
//	                	return;
//	                }
//	            },
//	            error : function(errorThrown){
//	             alert(errorThrown.statusText);
//	          }
//	         });
			ajaxFn(url, type, data, msg1, msg2);
		}
	};
	
	$(".update_content").css("display", "none");
	function updateBtn(seq){
		//alert(seq);
		const reply = $("#show_content_"+seq);
		reply.css("display", "none");
		const replyUpdate = reply.next().next("div").find(".update_content");
		replyUpdate.css("display", "block");
	}
	
//	$(".update_btn").click(function() {
//		$("#show_content").css("display", "none");
//		$(".update_content").css("display", "block");
//	});

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