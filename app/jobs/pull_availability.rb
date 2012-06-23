class PullAvailability
  @queue = :availability

  def self.perform(possible_time_id)
    PullAvailability.run(PossibleTime.find(possible_time_id))
  end

  def self.run(possible_time)
    possible_time.event.attendees.each do |attendee|
      if attendee.user.google
        GoogleCalendar.new(attendee.user, possible_time).save_availability
      end
    end
  end

end
