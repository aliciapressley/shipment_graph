// Generated by CoffeeScript 1.10.0
(function() {
  var random;

  this.Shipments = new Mongo.Collection("shipments");

  Shipments.allow({
    insert: function() {
      return true;
    },
    update: function() {
      return true;
    }
  });

  Router.route('/register', {
    template: 'register'
  });

  Router.configure({
    layoutTemplate: 'main'
  });

  Router.route('/', {
    template: 'home',
    name: 'home'
  });

  Template.home.rendered = function() {
    var result, shipment_costs, shipment_dates;
    result = Shipments.find().fetch();
    shipment_dates = _.pluck(result, 'date');
    shipment_costs = _.pluck(result, 'cost');
    console.log(shipment_dates);
    Tracker.autorun(function() {});
    return $(function() {
      $('#shipment_count').highcharts({
        title: {
          text: 'Shipment Cost Over Time',
          x: -20
        },
        subtitle: {
          text: '',
          x: -20
        },
        xAxis: [
          {
            type: 'datetime',
            minTickInterval: 24 * 3600 * 1000
          }, {
            type: "datetime",
            opposite: true,
            minTickInterval: 24 * 3600 * 1000
          }
        ],
        yAxis: {
          labels: {
            format: '${value}'
          },
          title: {
            text: 'Dollars'
          },
          plotLines: [
            {
              value: 0,
              width: 1,
              color: '#808080'
            }
          ]
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: [
          {
            name: 'Shipments',
            data: shipment_dates
          }
        ]
      });
    });
  };

  console.log('Hello world');

  console.log('Hello client');

  random = 0.5;

}).call(this);

//# sourceMappingURL=shipment_graph.js.map
