$ = jQuery.sub()
Event = App.Event

class App.Events extends Spine.Controller

  constructor: ->
    super
    Event.bind 'refresh change', @render
    Event.fetch({id: scoped_event_id})

  render: =>
    @event = Event.first()
    @html @view('events/show')(@event)
    $("#map").append(@view('events/map')(@event))