class App.Attendee extends Spine.Model
  @configure 'Attendee', 'username,', 'avatar,', 'event_id,', 'user_id'
  @extend Spine.Model.Ajax

  @url: => "/events/#{scoped_event_id}/attendees/"