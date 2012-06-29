Menu = App.Menu

class App.Menus extends Spine.Controller

  events:
    "click .plusOne"     : "plusOne"
    "click .continue"    : "continueAccordian"
    "click .remove_menu" : "removeMenu"

  elements:
    ".menu_container" : "menu_container"

  constructor: (user_id) ->
    super
    Menu.bind 'refresh change', @render
    Menu.fetch()

  render: =>
    @html @view("menus/index")
    for menu in Menu.all()
      new App.MenuItem({ el: @menu_container, menu: menu})

  plusOne: (e) =>
    $(".menu_container").fadeOut()
    App.Menu.find(e.target.id).incrementLikes()

  removeMenu: (e) =>
    e.preventDefault()
    App.Menu.find(e.target.id).destroy()

  continueAccordian: (e) =>
    e.preventDefault()
    App.Accordian.continue("#food")

class App.MenuItem extends Spine.Controller

  constructor: ->
    super
    @render()

  render: =>
    $(".menu_container").append(@view('menus/menu')(@menu))
