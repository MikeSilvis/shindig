#= require pusher

$ = jQuery

class PusherHandler extends Spine.Module

  constructor: (@options = {}) ->
    @options.key or= $("meta[name=pusher-key]").attr('content')
    @pusher = new Pusher(@options.key, @options)
    @channel = @pusher.subscribe 'observer'
    @channel.bind_all @process

  process: (type, msg) =>
    klass = eval("App.#{msg.class}") if msg
    if klass == App.Attendee
      msg.id = msg.menu_id
      klass  = App.Menu
    switch type
      when 'create'
        klass.fetch(id: msg.id)
      when 'update'
        klass.fetch(id: msg.id)

$ -> new PusherHandler