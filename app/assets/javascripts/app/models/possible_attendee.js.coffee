class App.PossibleAttendee extends Spine.Model
  @configure 'PossibleAttendee', 'possible_time_id', 'user_id'
  @extend Spine.Model.Ajax

  @url: => "/events/#{scoped_event_id}/possible_attendees"