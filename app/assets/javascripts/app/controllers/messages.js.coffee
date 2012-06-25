Message = App.Message

class App.Messages extends Spine.Controller

  events:
    "submit": "createMessage"

  constructor: ->
    super
    Message.bind "refresh", @render
    Message.fetch()

  render: =>
    $(".messages").append(@html @view('messages/index'))
    for message in Message.all()
      new App.MessageItem(message)

  createMessage: (e) ->
    e.preventDefault()
    App.Message.create content: $("#content").val()
    e.target.reset()

class App.MessageItem extends Spine.Controller

  constructor: (message) ->
    @message = message
    @render()

  render: =>
    $("#message_container").append(@view('messages/message')(@message))
    $("#message_container").scrollTop(11000)