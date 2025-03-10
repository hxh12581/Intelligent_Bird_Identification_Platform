var a=1;
var b=2;
var c=a+b;
console.log(c) // console.log输出在浏览器的控制台
// alert('你好')
// 绘制饼状图
function pieChart1() {
  $.ajax({
      url: '/jobcount',
      method: 'post',
      data: {},
      dataType: 'json',
      success: function (data) {
          //----start------
          var chartDom = document.getElementById('pieChart1');
          var myChart = echarts.init(chartDom);
          var option;
          pieData = []
          for(i=0;i<data.length;i++){
            pieData[i] = {value: data[i].typecount, name: data[i].jobtype}
          }

          option = {
            title: {
              text: '不同类别的职位数量对比图',
              subtext: 'Fake Data',
              left: 'center'
            },
            tooltip: {
              trigger: 'item'
            },
            legend: {
              orient: 'vertical',
              left: 'left'
            },
            series: [
              {
                name: 'Access From',
                type: 'pie',
                radius: '50%',
                data: pieData,
                emphasis: {
                  itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                  }
                }
              }
            ]
          };

          option && myChart.setOption(option);
          //----end-----
      }
  })
}
pieChart1()