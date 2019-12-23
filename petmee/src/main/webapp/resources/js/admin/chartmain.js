//통계검색
let modal = document.getElementById("searchstasticspopup");
let modal2 = document.getElementById("searchproductpopup");
let searchDateList = [];
let searchCountList =[];
let searchPriceList=[];
let orderList = [];
var myLine = null;
var myLine2 = null;


//모달창 닫기
$(".closeModal").click((e) => {
	modal.style.display = "none";
	modal2.style.display = "none";
	searchDateList = [];
	searchCountList =[];
	searchPriceList=[];
	orderList = [];
	myLine.destroy();
	$("#searchOrderTbody").html("");
});
window.onclick = (e) => {
    if (e.target == modal) {
        modal.style.display = "none";
        modal2.style.display = "none";
        searchDateList = [];
    	searchCountList =[];
    	searchPriceList=[];
    	orderList = [];
    	myLine.destroy();
    	$("#searchOrderTbody").html("");
    }
}
//모달창 닫기
$(".closebtn").click((e) => {
	modal.style.display = "none";
	modal2.style.display = "none";
	searchDateList = [];
	searchCountList =[];
	searchPriceList=[];
	orderList = [];
	myLine.destroy();
	$("#searchOrderTbody").html("");
});


//차트 그리기
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example

//우선 컨텍스트를 가져옵니다. 
var ctx = document.getElementById("myChart");
var ctx2 = document.getElementById("myProductChart");
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
var BarChartData = {
 type: 'bar',
 data: {
     labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
     datasets: [{
         label: '# of Votes',
         data: [12, 19, 3, 5, 2, 3],
         backgroundColor: [
             'rgba(255, 99, 132, 0.2)',
             'rgba(54, 162, 235, 0.2)',
             'rgba(255, 206, 86, 0.2)',
             'rgba(75, 192, 192, 0.2)',
             'rgba(153, 102, 255, 0.2)',
             'rgba(255, 159, 64, 0.2)'
         ],
         borderColor: [
             'rgba(255,99,132,1)',
             'rgba(54, 162, 235, 1)',
             'rgba(255, 206, 86, 1)',
             'rgba(75, 192, 192, 1)',
             'rgba(153, 102, 255, 1)',
             'rgba(255, 159, 64, 1)'
         ],
         borderWidth: 1
     }]
 },
 options: {
     maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
     scales: {
         yAxes: [{
             ticks: {
                 beginAtZero:true
             }
         }]
     }
 }
};
var chartData = {
		  type: 'line',
		  data: {
		    labels: searchDateList,
		    datasets: [{
		      label: "구매횟수",
		      lineTension: 0.3,
		      backgroundColor: "rgba(2,117,216,0.2)",
		      borderColor: "rgba(2,117,216,1)",
		      fill: true,
		      pointRadius: 5,
		      pointBackgroundColor: "rgba(2,117,216,1)",
		      pointBorderColor: "rgba(255,255,255,0.8)",
		      pointHoverRadius: 5,
		      pointHoverBackgroundColor: "white",
		      pointHoverBorderColor: "rgba(2,117,216,1)",
		      pointHoverRadius: 8,
		      pointHitRadius: 50,
		      pointBorderWidth: 2,
		      pointHoverBorderWidth: 4,
		      data: searchCountList
		    }],
		  },
		  options: {
			 maintainAspectRatio: true,
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: true
		        },
		        ticks: {
		          maxTicksLimit: 12
		        }
		      }],
		      yAxes: [{
		    	  scaleLabel: {
		    	  		scaleFontSize: 500,
		    	  		display: true,
		    	  		labelString: "월 구매 횟수",
	                    fontColor: "rgba(2,117,216,1)",
	                    fontSize: 20,
	                    fontStyle: "bold"
		    	  	},
		        ticks: {
		          min: 0,
		          max: 100,
		          maxTicksLimit: 10
		        },
		        gridLines: {
		          color: "rgba(0, 0, 0, .125)",
		        }
		      }],
		    },
		    legend: {
		      display: true
		    },
		  }
		};
var chartData2 = {
		type: 'line',
		data: {
			labels: searchDateList,
			datasets: [{
				label: "구매액",
				lineTension: 0.3,
				backgroundColor: "rgba(255, 99, 132,0.2)",
				borderColor: "rgba(255, 99, 132,1)",
				fill: true,
				pointRadius: 5,
				pointBackgroundColor: "rgba(255, 99, 132,1)",
				pointBorderColor: "rgba(255,255,255,0.8)",
				pointHoverRadius: 8,
				pointHoverBackgroundColor: "white",
				pointHoverBorderColor: "rgba(255, 99, 132,1)",
				pointHitRadius: 50,
				pointBorderWidth: 2,
				pointHoverBorderWidth: 4,
				data: searchPriceList
			}],
		},
		options: {
			maintainAspectRatio: true,
			scales: {
				xAxes: [{
					time: {
						unit: 'date'
					},
					gridLines: {
						display: true
					},
					ticks: {
						maxTicksLimit: 12
					}
				}],
				yAxes: [{scaleLabel: {
					scaleFontSize: 500,
					display: true,
					labelString: "월 구매액",
					fontColor: "rgba(255, 99, 132,1)",
					fontSize: 20,
					fontStyle: "bold"
				},				
				ticks: {
					min: 0,
					max: 1000000,
					maxTicksLimit: 10
				},
				gridLines: {
					color: "rgba(0, 0, 0, .125)",
				}
				}],
			},
			legend: {
				display: true
			},
		}
};

$(document).on("click","#search-UserStatistics", (e) => {	
	if($("#searchKeyword").val() === "") {alert("검색할 아이디를 입력하세요."); return;}
	console.log($("#searchCategory").val());
	if($("#searchCategory").val() == 2) {makeProductModal(); return;}
	$.ajax({
		url: "searchStatistics.do",
		data: {id: $("#searchKeyword").val(), categoryNo:$("#searchCategory").val()},
		async: false,
		success: result => {
			for(let i = 0 ; i < result.dateList.length - 1; i++) {
				searchDateList.push(result.dateList[i]);
				searchCountList.push(result.countList[i]);
				searchPriceList.push(result.priceList[i]);				
			}
			myLine = new Chart(ctx,chartData);
			orderList = result.orderList;
			let lastOrder = orderList[orderList.length - 1];
			let user = result.user
			if (user === null) {alert("존재하지 않는 아이디입니다."); return;}
			let query = `
			<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 회원 이름 : ${user.name}</div>
			<div><img src="/petmee/resources/images/admin/dogcara.jpg" />  성별 : ${user.gender}</div>
			<div><img src="/petmee/resources/images/admin/dogcara.jpg" />  연락처 : ${user.phone}</div>
			<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 이번 달 구매 횟수 : ${result.countList[result.countList.length - 1]}회</div>
			<div><img src="/petmee/resources/images/admin/dogcara.jpg" />  이번 달 구매 총액 : ${result.priceList[result.priceList.length - 1]}원</div>
			`;
			let tableQuery;
			for(let i = 0; i < orderList.length; i++) {
				tableQuery += `
					<tr>
						<td>${orderList[i].date}</td>
						<td>${orderList[i].orderId}</td>
						<td>${orderList[i].productId}</td>
						<td>${orderList[i].productCnt}</td>
						<td>${orderList[i].price}</td>
						<td>${orderList[i].paymentMethod}</td>
						<td>${orderList[i].delieveryStatus}</td>
					</tr>
				`;
			}
			$(".searchTitle").html(`♣ ${user.email}님 통계 내역`);
			$("#statisticsInfo").html(query);
			$("#searchOrderTbody").html(tableQuery);
			$("#searchKeyword").val("");
			modal.style.display = "block";
		}
	})	
});
$("#changeCountChart").click((e) => {
	myLine.destroy(); myLine = new Chart(ctx,chartData);
});
$("#changePriceChart").click((e) => {
	myLine.destroy(); myLine = new Chart(ctx,chartData2);
});
$("#changeCountChart2").click((e) => {
	myLine2.destroy(); myLine2 = new Chart(ctx2,chartData);
});
$("#changePriceChart2").click((e) => {
	myLine2.destroy(); myLine2 = new Chart(ctx2,chartData2);
});
function makeProductModal() {
	$.ajax({
		url: "searchStatistics.do",
		data: {id: $("#searchKeyword").val(),categoryNo: $("#searchCategory").val()},
		async: false,
		success: result => {
			let product = result.product
			if (product === null) {alert("존재하지 않는 제품입니다."); return;}
			for(let i = 0 ; i < result.dateList.length - 1; i++) {
				searchDateList.push(result.dateList[i]);
				searchCountList.push(result.countList[i]);
				searchPriceList.push(result.priceList[i]);				
			}
			myLine2 = new Chart(ctx2,chartData);
			let query = `
				<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 제품명 : ${product.productName}</div>
				<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 가격 : ${product.price}</div>
				<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 현재 재고: ${product.stock}</div>
				<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 제품설명 : ${product.productInfo}</div>
				<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 제조사 : ${product.company}</div>
				<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 이번달 판매량 :${result.countList[result.countList.length - 1]}</div>
				<div><img src="/petmee/resources/images/admin/dogcara.jpg" /> 이번달 판매액 : ${result.priceList[result.priceList.length - 1]}</div>
			`;
			$("#statisticsInfo2").html(query);	
			$(".searchTitle2").html(`♣ ${product.productId}제품 통계 내역`);
			$("#searchKeyword").val("");
			modal2.style.display = "block";
		}
	});
}
