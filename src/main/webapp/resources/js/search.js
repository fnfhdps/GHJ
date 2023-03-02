/**
 *  검색 이벤트 js
 */

	let moveForm = $("#moveForm");

	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
	    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	    moveForm.attr("action", "/admin/adopt");
	    moveForm.submit();
	});
  
	$(".search_area button").on("click", function(e){
		e.preventDefault();
	    let val = $("input[name='keyword']").val();
	    moveForm.find("input[name='keyword']").val(val);
	    moveForm.find("input[name='pageNum']").val(1);
	    moveForm.submit();
	  });