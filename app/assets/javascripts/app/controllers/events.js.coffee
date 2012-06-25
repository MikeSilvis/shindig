$ = jQuery.sub()
Event = App.Event

class Show extends Spine.Controller

  constructor: ->
    super
    Event.bind 'refresh change', @render
    Event.fetch({id: scoped_event_id})

  render: =>
    @event = Event.first()
    new App.Users(@event.user_id)
    $(".event_title").append(@html @view('events/show')(@event))
    $(".map").append(@view('events/map')(@event))

class App.Events extends Spine.Stack
  controllers:
    show: Show

  routes:
    '/events/:id':      'show'

  default: 'show'
  className: 'stack events'