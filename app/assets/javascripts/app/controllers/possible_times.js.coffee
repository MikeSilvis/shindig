PossibleTime = App.PossibleTime

class App.PossibleTimes extends Spine.Controller

  events:
    "click .yes"                : "addAvailabilityForAttendee"
    "click .no"                 : "removeAvailabilityForAttendee"
    "click .remove_time"        : "removePossibleTime"
    'submit #new_possible_time' : "addPossibleTime"

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
      times_am = ["1:00am", "1:30am", "2:00am", "2:30am", "3:00am", "3:30am", "4:00am", "4:30am", "5:00am", "5:30am", "6:00am", "6:30am", "7:00am", "7:30am", "8:00am", "8:30am", "9:00am", "9:30am", "10:00am", "10:30am", "11:00am", "11:30am", "12:00am", "12:30am"]
      times_pm = ["1:00pm", "1:30pm", "2:00pm", "2:30pm", "3:00pm", "3:30pm", "4:00pm", "4:30pm", "5:00pm", "5:30pm", "6:00pm", "6:30pm", "7:00pm", "7:30pm", "8:00pm", "8:30pm", "9:00pm", "9:30pm", "10:00pm", "10:30pm", "11:00pm", "11:30pm", "12:00pm", "12:30pm"]
      $("#add_time_start").typeahead({
        source: times_am.concat times_pm,
      })
      $("#add_time_end").typeahead({
        source: times_am.concat times_pm,
      })
      $("#calendar").fullCalendar
        editable: false
        events: "/events/#{scoped_event_id}/possible_times.json"
        eventClick: (calEvent, jsEvent, view) ->
          new App.TimeItem(calEvent)

