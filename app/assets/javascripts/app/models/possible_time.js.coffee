class App.PossibleTime extends Spine.Model
  @configure 'PossibleTime', 'event_id', 'time_end', 'time_start'
  @extend Spine.Model.Ajax

  @url: => "/events/#{scoped_event_id}/possible_times"

  confirmTimeForAttendee: =>
  	App.PossibleAttendee.create possible_time_id: this.id
  	App.PossibleTime.fetch()

  removeTimeForAttendee: =>
    new App.PossibleAttendee({id: this.current_user_attendee_id}).destroy()
    App.PossibleTime.fetch()

  @formatAndSubmit:(date, time_start, time_end) ->
    # Sorry West Coast...
    time_start  = date + " "  + time_start + " EDT"
    time_end    = date +  " " + time_end + " EDT"
    App.PossibleTime.create time_start: time_start, time_end: time_end
    App.PossibleTime.fetch()