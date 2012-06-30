class @App.User extends Spine.Model
  @configure 'User', 'email', 'name', 'username', 'avatar'
  @extend Spine.Model.Ajax

  @url: => "/api/v1/events/#{scoped_event_id}/users"