class App.Message extends Spine.Model
  @configure 'Message', 'event_id', 'content', 'user_id'
  @extend Spine.Model.Ajax

  @url: => "/api/v1/events/#{scoped_event_id}/messages/"
