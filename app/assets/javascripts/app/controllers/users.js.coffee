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

  constructor: ->
    super
    User.bind 'refresh', @render
    App.User.fetch({id: $("meta[name=user_token]").attr('content')})

  render: =>
    window.current_user = User.first()
    @events             = new App.Events({ el: @eventEl })
    @possibleTime       = new App.PossibleTimes({ el: @possibleTimesEl })
    @messages           = new App.Messages({ el: @messagesEl })
    @menus              = new App.Menus({ el: @menusEl })
    @restaurants        = new App.Restaurants({ el: @restaurantEl })
    @attendees          = new App.Attendees({ el: @attendeesEl })

