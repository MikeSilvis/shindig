class AttendeeSweeper < ActionController::Caching::Sweeper
	observe Attendee

	def sweep(attendee)
    # expire_page create_attendee_event_attendees
    # expire_page create_attendee_event_attendee(attendee)
    # expire_page api_v1_event_attendees
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end