/**
 *  차트 js
 */

$(function () {
	getWeekJoinCnt();
	monthSponsorCnt();
	//monthSponsorPrice();
});    
    
function getWeekJoinCnt() {
	let joinDate = [];
	let joinCnt = [];
	
    $.ajax({
        url : "/admin/chart/join",
        type : "GET",
        //data : JSON.stringify(data),
        dataType : "json",
        contentType : "application/json",
        success : function(data){
        	console.log(data);
			for (let i = 0; i < data.length; i++) {
				joinDate.push(data[i].CHARTDATE);
				joinCnt.push(data[i].CNT);
			}
			console.log(joinDate);
			console.log(joinCnt);
           
           new Chart(document.getElementById('weekJoin'),{
               type: 'line', // 차트의 형태
               data: { // 차트에 들어갈 데이터
                   labels: joinDate,
                   datasets: [
                       { //데이터
                           label: '주차별 가입자수', //차트 제목
                           //fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                           backgroundColor: [
                               //색상
//                               'rgba(255, 99, 132, 0.2)',
                               'rgba(54, 162, 235, 0.2)',
//                               'rgba(255, 206, 86, 0.2)',
//                               'rgba(75, 192, 192, 0.2)',
//                               'rgba(153, 102, 255, 0.2)',
//                               'rgba(255, 159, 64, 0.2)',
//                               'rgba(255, 99, 132, 0.2)'
                           ],
                           borderColor: [
                               //경계선 색상
//                               'rgba(255, 99, 132, 1)',
                               'rgba(54, 162, 235, 1)',
//                               'rgba(255, 206, 86, 1)',
//                               'rgba(75, 192, 192, 1)',
//                               'rgba(153, 102, 255, 1)',
//                               'rgba(255, 159, 64, 1)',
//                               'rgba(255, 99, 132, 1)'
                           ],
                           borderWidth: 1, //경계선 굵기
                           data: joinCnt // ajax결과 데이터 값
                       }
                   ]
               },
               options: {
                   scales: {
                       yAxes: [
                           {
                               ticks: {
                                   beginAtZero: true
                               }
                           }
                       ]
                   }
               }
           })
        },
        error : function(errorThrown){
         alert(errorThrown.statusText);
      }
     });
}

function monthSponsorCnt() {
	let sponsorDate = [];
	let sponsorCnt = [];
	
	$.ajax({
		url : "/admin/chart/sponsorcnt",
		type : "GET",
		//data : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json",
		success : function(data){
			for (let i = 0; i < data.length; i++) {
				sponsorDate.push(data[i].CHARTDATE);
				sponsorCnt.push(data[i].CHARTVAL);
				
			}
			//console.log(sponsorDate);
			//console.log(sponsorCnt);
			
			new Chart(document.getElementById('monthSponsor'),{
				type: 'line', // 차트의 형태
				data: { // 차트에 들어갈 데이터
					labels: sponsorDate, // x축
						datasets: [
							{ //데이터
								label: '결제금액', //차트 제목
								//fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
								backgroundColor: [
									//색상
									'rgba(75, 192, 192, 0.2)',
									],
									borderColor: [
										//경계선 색상
										'rgba(75, 192, 192, 1)',
										],
										borderWidth: 1, //경계선 굵기
										data: sponsorCnt // ajax결과 데이터 값
							}
							]
				},
				options: {
					scales: {
						yAxes: [
							{
								ticks: {
									beginAtZero: true
								}
							}
							]
					}
				}
			})
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		}
	});
}


function monthSponsorPrice() {
	let sponsorDate = [];
	let sponsorPrice = [];
	
	$.ajax({
		url : "/admin/chart/sponsorprice",
		type : "GET",
		//data : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json",
		success : function(data){
			for (let i = 0; i < data.length; i++) {
				sponsorDate.push(data[i].CHARTDATE);
				sponsorPrice.push(data[i].CHARTVAL);
			}
			
			new Chart(document.getElementById('monthSponsor'),{
				type: 'line', // 차트의 형태
				data: { // 차트에 들어갈 데이터
					labels: sponsorDate, // x축
					datasets: [
						{ //데이터
							label: '결제건수', //차트 제목
							//fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							backgroundColor: [
								//색상
//								'rgba(255, 99, 132, 0.2)',
//								'rgba(54, 162, 235, 0.2)',
//									'rgba(153, 102, 255, 0.2)',
//									'rgba(255, 159, 64, 0.2)',
									'rgba(255, 99, 132, 0.2)'
								],
								borderColor: [
									//경계선 색상
//									'rgba(255, 99, 132, 1)',
//									'rgba(54, 162, 235, 1)',
//										'rgba(153, 102, 255, 1)',
//										'rgba(255, 159, 64, 1)',
										'rgba(255, 99, 132, 1)'
									],
									borderWidth: 1, //경계선 굵기
									data: sponsorPrice // ajax결과 데이터 값
						}
						]
				},
				options: {
					scales: {
						yAxes: [
							{
								ticks: {
									beginAtZero: true
								}
							}
							]
					}
				}
			})
		},
		error : function(errorThrown){
			alert(errorThrown.statusText);
		}
	});
}

$("#cnt").click(function() {
	monthSponsorCnt();
});
$("#price").click(function() {
	monthSponsorPrice();
});


