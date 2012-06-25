class PullAvailabilityTime
  @queue = :availability_time

  def self.perform(possible_time_id)
    PullAvailabilityTime.run(PossibleTime.find(possible_time_id))
  end

  def self.run(possible_time)
    possible_time.event.attendees.each do |attendee|
      if attendee.user.google
        GoogleCalendar.new(attendee.user, possible_time).save_availability
      end
    end
  end

end
