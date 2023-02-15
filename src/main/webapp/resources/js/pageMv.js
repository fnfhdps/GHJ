/**
 * 
 */

  //이전글, 다음글
	data = {
			"boardSeq" : boardSeq,
			"boardCategory" : boardCategory,
			"userSeq" : userSeq2
	};
	//alert("boardSeq:"+boardSeq+"boardCategory:"+category+"userSeq: "+userSeq2);
	
	// 이전글
	$.ajax({
		url: "/before",
		type: "get",
		data: data,
		dataType: "text",
		success: function(result){
			if(result == 0) {
				$("#before").text("이전글이 없습니다");
			} else if(result == -1) {
				alert("통신 오류");
				return;
			} else {
				let beforeSeq = result.findSeq;
				let beforeTitle = result.findTitle;
				$("#before").attr("href", "/adopt/"+category+"/"+beforeSeq+"/"+userSeq2);
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
		success: function(result){
			alert(result);
			if(result == 0) {
				$("#after").text("다음글이 없습니다");
			} else if(result == -1) {
				alert("통신 오류");
				return;
			} else {
				let afterSeq = result.findSeq;
				let afterTitle = result.findTitle;
				$("#after").attr("href", "/adopt/"+boardCategory+"/"+afterSeq+"/"+userSeq2);
				$("#after").text(afterTitle);
			}
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		},
		dataType: "json"
	});	