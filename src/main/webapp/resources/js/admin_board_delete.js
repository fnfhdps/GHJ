/**
 * 관리자 게시글 삭제 js
 */

function boardDelete(seq) {;
	const data = { "boardSeq" : seq};
	if(window.confirm("글을 삭제 하시겠습니까?")){
		$.ajax({
		    url : url,
		    type :'post',
		    data : JSON.stringify(data),
		    dataType : "json",
		    contentType : "application/json",
		    async : true,
		    success : function(result){
		        if(result == 0){
		            window.location.href = successPath;
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