class App.PossibleTime extends Spine.Model
  @configure 'PossibleTime', 'event_id', 'time_end', 'time_start'
  @extend Spine.Model.Ajax
  @url: => "/events/#{scoped_event_id}/possible_times"