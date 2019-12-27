// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
var idList = [];
var cntList = [];
$.ajax({
	url: "monthtop.do",
	dataType: "json",
	async: false,
	success: (result) => {
		for(let p of result) {
			idList.push(p.productId);
			cntList.push(p.cnt);			
		}
	}
});
// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: idList,
    datasets: [{
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: cntList,
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'product_name'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 5
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 40,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
