User = App.User

class App.Users extends Spine.Controller

  constructor: ->
    super
    User.bind 'refresh', @render
    App.User.fetch()

  render: =>
    @user = User.first()
    @html @view('users/show')(@user)

class App.CurrentUser extends Spine.Controller

  elements:
    "#event"       : "eventEl"
    "#times"       : "possibleTimesEl"
    "#messages"    : "messagesEl"
    "#menus"       : "menusEl"
    "#restaurant"  : "restaurantEl"
    "#attendees"   : "attendeesEl"
    "#share"       : "shareEl"
    "#items"        : "itemEl"

  constructor: ->
    super
    User.bind 'refresh', @render
    App.User.fetch({id: "current"})

  render: =>
    window.current_user = User.first()
    @events             = new App.Events({ el: @eventEl })
    @attendees          = new App.Attendees({ el: @attendeesEl })
    @possibleTime       = new App.PossibleTimes({ el: @possibleTimesEl })
    @messages           = new App.Messages({ el: @messagesEl })
    @items              = new App.Items({ el: @itemEl })
    @share              = new App.Shares({ el: @shareEl })

