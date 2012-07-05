#= require pusher

$ = jQuery

class PusherHandler extends Spine.Module

  constructor: (@options = {}) ->
    @options.key or= $("meta[name=pusher-key]").attr('content')
    @pusher = new Pusher(@options.key, @options)
    @channel = @pusher.subscribe 'observer'
    @channel.bind_all @process

  process: (event_id, msg) =>
    klass = eval("App.#{msg.class}") if msg
    if klass == App.Attendee
      App.Menu.fetch(id: msg.menu_id) if event_id == scoped_event_id
    if klass == App.PossibleAttendee
      App.PossibleTime.fetch(id: msg.possible_time_id) if event_id == scoped_event_id

    klass.fetch(id: msg.id) if event_id == scoped_event_id

$ -> new PusherHandler