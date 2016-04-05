

if Meteor.isClient
  Template.hello.onCreated ->
    @counter = new ReactiveVar(0)
    return
  Template.hello.helpers counter: ->
  Template.instance().counter.get()
  Template.hello.events 'click button': (event, instance) ->
    instance.counter.set instance.counter.get() + 1
    return
return

Template.shipment_home.rendered = ->
  Tracker.autorun ->
    $('#shipment_count').highcharts
      title:
        text: 'LTL Audit and Savings Calculations'
        x: -20
      subtitle:
        text: ''
        x: -20
      xAxis: categories: [
        'Jan'
        'Feb'
        'Mar'
        'Apr'
        'May'
        'Jun'
        'Jul'
        'Aug'
        'Sep'
        'Oct'
        'Nov'
        'Dec'
      ]
      yAxis:
        title: text: 'Dollar amount ($)'
        plotLines: [ {
          value: 0
          width: 1
          color: '#808080'
        } ]
      tooltip: valuePrefix: '$'
      legend:
        layout: 'vertical'
        align: 'right'
        verticalAlign: 'middle'
        borderWidth: 0
      series: [
        {
          name: 'Net Charges'
          data: [
            7.0
            6.9
            9.5
            14.5
            18.2
            21.5
            25.2
            26.5
            23.3
            18.3
            13.9
            9.6
          ]
        }
        {
          name: 'Audit Savings'
          data: [
            0.2
            0.8
            5.7
            11.3
            17.0
            22.0
            24.8
            24.1
            20.1
            14.1
            8.6
            2.5
          ]
        }
        {
          name: 'Consulting Savings'
          data: [
            5.9
            0.6
            3.5
            8.4
            13.5
            17.0
            18.6
            17.9
            14.3
            9.0
            3.9
            1.0
          ]
        }
        {
          name: 'Tech Savings'
          data: [
            4.9
            5.2
            6.7
            8.5
            11.9
            15.2
            17.0
            16.6
            14.2
            10.3
            9.6
            4.8
          ]
        }
        {
          name: 'Total LTL Savings'
          data: [
            1.7
            3.9
            4.2
            5.7
            8.5
            11.9
            15.2
            17.0
            16.6
            14.2
            10.3
            6.6
          ]
        }
        {
          name: 'LTL Profit'
          data: [
            3.9
            4.2
            5.7
            8.5
            15
            18.2
            19.0
            23
            14.2
            12.3
            6.6
            7.8
          ]
        }
      ]
    return
