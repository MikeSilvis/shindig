Attendee = App.Attendee

class App.Attendees extends Spine.Controller

  events:
    "click": "renderModal"

  constructor: ->
    super
    Attendee.bind "refresh", @render
    Attendee.fetch()

  render: =>
    @attendees = Attendee.all()
    @html @view('attendees/index')(attendee_count: @attendees.length)
    for attendee in Attendee.all()
      new App.AttendeeItem(attendee)

  createMessage: (e) ->
    e.preventDefault()
    App.Attendee.create content: $("#content").val()
    e.target.reset()

  renderModal: =>
    $('#attendeeModal').modal('show')
    $("#attendeeModalContent").html("")
    $("#attendeeModalContent").append(@view("attendees/modal")(attendees: @attendees))


class App.AttendeeItem extends Spine.Controller

  constructor: (attendee) ->
    @attendee = attendee
    @render()

  render: =>
    $("#attendee_container").append(@view('attendees/attendee')(@attendee))