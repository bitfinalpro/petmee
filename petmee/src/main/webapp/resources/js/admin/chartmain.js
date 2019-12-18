let modal = document.getElementById("searchstasticspopup");
$("#search-UserStatistics").click((e) => {
//	let category = $("searchCategory").val();
//	$.post({
//		url: "searchStatistics.do",
//		data: {category: category, val: $("#searchKeyword").val()},
//		success: result => {}
//	})
	modal.style.display = "block";
});
$(".close").click((e) => {
	modal.style.display = "none";
});
window.onclick = (e) => {
    if (e.target == modal) {
        modal.style.display = "none";
    }
}
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
var labelList = [];
var dataList = [];
$.ajax({
	url: "monthlyMargin.do",
	dataType: "json",
	async: false,
	success: (result) => {
		for(let p of result) {
			labelList.push(p.date);
			dataList.push(p.profit);			
		}
	}
});
// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [15000, 3000, 5000, 6000],
    datasets: [{
      label: "profit:",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: ["a", "b", "c", d]
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 13
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 1000000000,
          maxTicksLimit: 10
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
