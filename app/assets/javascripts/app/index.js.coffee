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

  elements:
    "#event"       : "eventEl"
    "#times"       : "possibleTimesEl"
    "#messages"    : "messagesEl"
    "#menus"       : "menusEl"
    "#restaurant"  : "restaurantEl"
    "#attendees"   : "attendeesEl"

  constructor: ->
    super
    @events         = new App.Events({ el: @eventEl })
    @possibleTime   = new App.PossibleTimes({ el: @possibleTimesEl })
    @messages       = new App.Messages({ el: @messagesEl })
    @menus          = new App.Menus({ el: @menusEl })
    @restaurants    = new App.Restaurants({ el: @restaurantEl })
    @attendees      = new App.Attendees({ el: @attendeesEl })

    # Spine.Route.setup()

window.App = App
window.scoped_event_id = new ParamsFinder().id()