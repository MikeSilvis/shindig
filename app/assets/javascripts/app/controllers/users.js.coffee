User = App.User

class App.Users extends Spine.Controller

  constructor: (user_id) ->
    super
    User.bind 'refresh', @render
    User.fetch({id: user_id}) if user_id

  render: =>
    @user = User.first()
    $(".planner_info").append(@html @view('users/show')(@user))