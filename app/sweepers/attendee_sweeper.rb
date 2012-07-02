class AttendeeSweeper < ActionController::Caching::Sweeper
	observe Attendee

	def sweep(attendee)
    expire_page api_v1_event_attendees_path
    expire_page api_v1_event_attendee_path(attendee)
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end