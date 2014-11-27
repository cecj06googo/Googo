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
        data: [{
            day: '2014-11-01',
            car: 2666,
            
        },{
        	day: '2014-11-01',
            moto: 3500,
            
        }, {
        	day: '2014-11-05',
            car: 2778,
            moto: 2294,
            bike: 2441
        }, {
        	day: '2014-11-10',
            car: 4912,
            moto: 1969,
            bike: 2501
        }, {
        	day: '2014-11-15',
            car: 3767,
            moto: 3597,
            bike: 5689
        }, {
        	day: '2014-11-20',
            car: 6810,
            moto: 1914,
            bike: 2293
        }, {
        	day: '2014-11-25',
            car: 5670,
            moto: 4293,
            bike: 1881
        }, {
        	day: '2014-12-1',
            car: 4820,
            moto: 3795,
            bike: 1588
        }, {
        	day: '2014-12-3',
            car: 4820,
            moto: 3795,
            bike: 1588
        }, {
        	day: '2014-12-4',
            car: 4820,
            moto: 3795,
            bike: 1588
        }, {
        	day: '2014-12-6',
            car: 4820,
            moto: 3795,
            bike: 1588
        }],
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
