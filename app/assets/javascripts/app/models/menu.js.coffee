class App.Menu extends Spine.Model
  @configure 'Menu', 'event_id', 'liked', 'restaraunt_id', 'name'
  @extend Spine.Model.Ajax

  @url: => "/events/#{scoped_event_id}/menus/"

  incrementLikes: =>
    this.liked = this.liked + 1
    this.save()
    # this.reload()