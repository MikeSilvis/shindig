class App.Menu extends Spine.Model
  @configure 'Menu', 'event_id', 'liked', 'restaraunt_id', 'name', 'ls_id'
  @extend Spine.Model.Ajax

  @url: => "/api/v1/events/#{scoped_event_id}/menus/"

  incrementLikes: =>
    current_attendee.updateMenuLikes(this.id)