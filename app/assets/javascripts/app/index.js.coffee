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

  constructor: ->
    super
    @current_user = new App.CurrentUser({ el: @el})
    @current_attendee = new App.CurrentAttendee({el: @el})
    @accordian = new App.Accordian({el: @el})

window.App = App
window.scoped_event_id = new ParamsFinder().id()