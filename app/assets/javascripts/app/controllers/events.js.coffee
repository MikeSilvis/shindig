$ = jQuery.sub()
Event = App.Event

class App.Events extends Spine.Controller
  constructor: ->
    super
    Event.bind 'refresh change', @render
    Event.fetch({id: scoped_event_id})

  render: =>
    @event = Event.first()
    window.event_token = @event.token
    @share = new App.Shares({ el: $("#share") })
    @html @view('events/show')(@event)
    $("#map").append(@view('events/map')(@event))
    new Map(@event.latitude, @event.longitude)

class Map extends Spine.Controller
  constructor: (lat, long) ->
    map = new Microsoft.Maps.Map(document.getElementById("map_holder"),
      credentials: "Akrds0LPok2BfVhlmrhoa5B_O2P_10AuLJg98mvTr0QlaWV9wss9Ih4xNO3HyTXC"
      center: new Microsoft.Maps.Location(lat, long)
      zoom: 15
    )
    pushpin = new Microsoft.Maps.Pushpin(map.getCenter(), null)
    map.entities.push pushpin
    pushpin.setLocation new Microsoft.Maps.Location(lat, long)