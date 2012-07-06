class PullAvailabilityAttendee
  @queue = :availability_attendee

  def self.perform(attendee_id)
    PullAvailabilityAttendee.run(Attendee.find(attendee_id))
  end

  def self.run(attendee)
    attendee.event.possible_times.each do |possible_time|
      GoogleCalendar.new(attendee.user, possible_time).save_availability if attende.user.google
    end
  end

end