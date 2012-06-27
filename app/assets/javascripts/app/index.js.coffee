#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route
#= require spine/relation

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller

  # Everything is scoped to the current_user model

  constructor: ->
    super
    @current_user = new App.CurrentUser({ el: @el})
    @current_attendee = new App.CurrentAttendee({el: @el})

    # Spine.Route.setup()

window.App = App
window.scoped_event_id = new ParamsFinder().id()