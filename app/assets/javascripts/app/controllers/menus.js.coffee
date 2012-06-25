Menu = App.Menu

class App.Menus extends Spine.Controller

  constructor: (user_id) ->
    super
    Menu.bind 'refresh change', @render
    Menu.fetch()

  render: =>
    $(".menu").append(@view("menus/index")(menus: @menus))
    for menu in Menu.all()
      new App.MenuItem(menu)

class App.MenuItem extends Spine.Controller

    constructor: (menu) ->
      @menu = menu
      @render()

    render: =>
      $("#menu_container").append(@view('menus/menu')(@menu))