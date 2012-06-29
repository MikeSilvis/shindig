Message = App.Message

class App.Messages extends Spine.Controller

  events:
    "submit"           : "createMessage"
    'click .continue'  : "continueAccordian"

  constructor: ->
    super
    Message.bind "refresh", @render
    Message.fetch()

  render: =>
    @html @view('messages/index')
    for message in Message.all()
      new App.MessageItem(message)

  createMessage: (e) ->
    e.preventDefault()
    App.Message.create content: $("#content").val()
    App.Message.fetch()
    e.target.reset()

  continueAccordian: (e) =>
    e.preventDefault()
    App.Accordian.continue("#messages")

class App.MessageItem extends Spine.Controller

  constructor: (message) ->
    @message = message
    @render()

  render: =>
    $("#message_container").append(@view('messages/message')(@message))
    $("#message_container").scrollTop(11000)