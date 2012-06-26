Menu = App.Menu

class App.Menus extends Spine.Controller

  events:
    "click": "plusOne"

  elements:
    ".menu_container" : "menu_container"

  constructor: (user_id) ->
    super
    Menu.bind 'refresh change', @render
    Menu.fetch()

  render: =>
    @html @view("menus/index")
    for menu in Menu.all().sort().reverse()
      new App.MenuItem({ el: @menu_container, menu: menu})

  plusOne: (e) =>
    App.Menu.find(e.target.id).incrementLikes()

class App.MenuItem extends Spine.Controller

  constructor: ->
    super
    @render()

  render: =>
    $(".menu_container").append(@view('menus/menu')(@menu))
