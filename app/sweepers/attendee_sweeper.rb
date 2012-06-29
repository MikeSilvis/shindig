class AttendeeSweeper < ActionController::Caching::Sweeper
	observe Attendee

	def sweep(attendee)
    expire_page create_attendee_event_attendees
    expire_page create_attendee_event_attendee(attendee)
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end