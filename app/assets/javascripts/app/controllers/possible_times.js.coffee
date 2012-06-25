PossibleTime = App.PossibleTime

class App.PossibleTimes extends Spine.Controller

  constructor: ->
    super
    @render()
    new CalendarMethods()

  render: =>
    $(".times").append(@view("possible_times/index"))

class App.TimeItem extends Spine.Controller

    constructor: ->
        super
        PossibleTime.bind 'refresh change', @render
        PossibleTime.fetch({id: this.id})

    render: =>
        @time = PossibleTime.find(this.id)
        $('#timeModal').modal('show')
        $("#modalContent").html("")
        $("#modalContent").append(@view("possible_times/show")(@time))

class CalendarMethods
    constructor: ->
      $("#calendar").fullCalendar
        editable: false
        events: "http://localhost:3000/events/1/possible_times.json"
        eventClick: (calEvent, jsEvent, view) ->
          new App.TimeItem(calEvent)

