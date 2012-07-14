Item = App.Item

class App.Items extends Spine.Controller

  events:
    "submit"           : "createItem"
    'click .continue'  : "continueAccordian"

  constructor: ->
    super
    Item.bind "refresh change", @render
    Item.fetch()

  render: =>
    @html @view('items/index')
    for item in Item.all()
      new App.SingleItem({item: item})

  createItem: (e) =>
    e.preventDefault()
    App.Item.create quantity: $("#quantity").val(), name: $("#item").val(), category_id: $("#category_id").val(), category: $("#category_id option:selected").text(), username: current_user.name

  continueAccordian: (e) =>
    e.preventDefault()
    App.Accordian.continue("#items")

class App.SingleItem extends Spine.Controller

  constructor: ->
    super
    @render()

  render: =>
    $(".item_container").append(@view('items/item')(@item))