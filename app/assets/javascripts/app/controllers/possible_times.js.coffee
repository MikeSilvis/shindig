PossibleTime = App.PossibleTime

class App.PossibleTimes extends Spine.Controller

  events:
    "click .yes"                : "addAvailabilityForAttendee"
    "click .no"                 : "removeAvailabilityForAttendee"
    "click .remove_time"        : "removePossibleTime"
    'submit #new_possible_time' : "addPossibleTime"
    'click .continue'           : "continueAccordian"

  constructor: ->
    super
    PossibleTime.bind 'refresh change', @render
    PossibleTime.fetch()
    @date = @currentDate()

  render: =>
    @possible_times = PossibleTime.all()
    @html @view("possible_times/index")(possible_times: @possible_times, date: @date)
    $('#add_date').datepicker()
    new CalendarMethods()
    @continueToolTip()

  continueToolTip: =>
    unless @possible_times.length
      $(".continue").addClass("disabled")
      $(".continue").tooltip({trigger: "hover"})

  currentDate: =>
    d = new Date()
    "#{(d.getMonth() + 1)}/#{d.getDate()}/#{d.getFullYear()}"

  addAvailabilityForAttendee: (e) =>
    App.PossibleTime.find(e.target.id).confirmTimeForAttendee()

  removeAvailabilityForAttendee: (e) =>
    e.preventDefault()
    App.PossibleTime.find(e.target.id).removeTimeForAttendee()

  addPossibleTime: (e) =>
    e.preventDefault()
    App.PossibleTime.formatAndSubmit($("#add_date").val(), $("#add_time_start").val(), $("#add_time_end").val())

  removePossibleTime: (e) =>
    e.preventDefault()
    $('#timeModal').modal('hide')
    App.PossibleTime.find($(".remove_time").attr("id")).destroy()

  continueAccordian: (e) =>
    e.preventDefault()
    App.Accordian.continue("#times") if @possible_times.length > 0

class App.TimeItem extends Spine.Controller

    constructor: ->
        super
        @render()

    render: =>
      @time = PossibleTime.find(this.id)
      $('#timeModal').modal('show')
      $("#timeModalContent").html("")
      $(".remove_time").attr('id', @time.id)
      $("#timeModalContent").append(@view("possible_times/show")(@time))

class CalendarMethods
    constructor: ->
      $("#add_time_end").chosen()
      $("#add_time_start").chosen()
      $("#calendar").fullCalendar
        editable: false
        events: "/api/v1/events/#{scoped_event_id}/possible_times.json"
        eventClick: (calEvent, jsEvent, view) ->
          new App.TimeItem(calEvent)

