class App.Attendee extends Spine.Model
  @configure 'Attendee', 'username,', 'avatar,', 'event_id,', 'user_id', 'menu_id'
  @extend Spine.Model.Ajax

  @url: => "/events/#{scoped_event_id}/attendees/"

  updateMenuLikes: (menu_id) =>
    this.menu_id = menu_id
    this.save()
    App.Menu.fetch()