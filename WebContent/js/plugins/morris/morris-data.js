// Morris.js Charts sample data for SB Admin template

$(function() {
	
	 // Bar Chart
    Morris.Bar({
        element: 'morris-bar-chart',
        data: barString,
        xkey: 'device',
        ykeys: ['geekbench'],
        labels: ['租車次數'],
        barRatio: 0.4,
        xLabelAngle: 35,
        hideHover: 'auto',
        //barColors: ['#ff0000', '#dc143c', '#ffff00', '#008000', '#7BB661', '#7BB661'],
        barColors: function (row, series, type) {
            if (type === 'bar') {
              var red = Math.ceil(650* row.y / this.ymax);
              return 'rgb(' + red + ',250,100)';
            }
            else {
              return '#ffa07a';
            }
          },
        resize: true
    });
    // Area Chart
    Morris.Area({
        element: 'morris-area-chart',
        data: areaString,
        xkey: 'day',
        ykeys: ['car', 'moto', 'bike'],
        labels: ['汽車', '機車', '腳踏車'],
        pointSize: 2,
        hideHover: 'auto',
        lineColors: ['#1e90ff','#ffa500','#7fff00'],
        resize: true
    });
    // Donut Chart
    Morris.Donut({
        element: 'morris-donut-chart',
        data: donutString,
        resize: true,
        colors: [
                 '#FFD306',
                 '#FFE153',
                 '#FFED97',
                 '#FF8F59',
                 '#F75000',
                 '#D94600',
                 '#BB3D00',
                 '#842B00',
                 '#FF0000'
               ],
        
    });

});
