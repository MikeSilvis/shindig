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
    @append(@events = new App.Events)
    @append(@possible_times = new App.PossibleTimes)

    # Spine.Route.setup()

window.App = App
window.event_id = new ParamsFinder().id()