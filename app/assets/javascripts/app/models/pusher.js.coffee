#= require pusher
$ = jQuery

class PusherHandler extends Spine.Module

  constructor: (@options = {}) ->
    @options.key or= $("meta[name=pusher-key]").attr('content')
    @pusher = new Pusher(@options.key, @options)
    @channel = @pusher.subscribe 'observer'
    @channel.bind_all @process

  process: (type, msg) =>
    if type == "create"
      @msg_id = msg.id
      App.Message.fetch({id: @msg_id})

$ -> new PusherHandler