class App.Restaurants extends Spine.Controller

  constructor: ->
    super
    App.Restaraunt.bind "refresh", @createMenu
    $.getJSON '/api/v1/restaraunts/search.json', @render

  render: (rest_array) =>
    @html @view('restaurant/index')
    $("#add_restaurant").typeahead({
      source: rest_array,
      onselect: (name) ->
        App.Restaraunt.fetch({id: name})
    })

  createMenu: =>
    rest = App.Restaraunt.first()
    App.Menu.create restaraunt_id: rest.id, name: rest.name
    $("#add_restaurant").val("")