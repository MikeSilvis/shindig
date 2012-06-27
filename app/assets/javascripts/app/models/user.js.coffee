class @App.User extends Spine.Model
  @configure 'User', 'email', 'name', 'username', 'avatar'
  @extend Spine.Model.Ajax

  @url: => "/events/#{scoped_event_id}/users"