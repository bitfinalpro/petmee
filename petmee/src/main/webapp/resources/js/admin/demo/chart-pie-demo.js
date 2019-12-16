// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
let categoryList = [];
$.ajax({
	url: "categorystatistics.do",
	dataType: "json",
	async: false,
	success: (result) => {
		for(let p of result) {
			categoryList.push(p.categoryName);
		}
	}
});
// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: categoryList,
    datasets: [{
      data: [12.21, 15.58, 10.24, 8.32, 1],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', "#e5e5e5"],
    }],
  },
});
