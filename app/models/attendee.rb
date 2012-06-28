class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :menu_id
  belongs_to :event
  belongs_to :user
  belongs_to :menu
  after_create :find_availability

  def self.add_event(token)
    event = Event.find_from_token(token)
    create(event_id: event.id)
  end

  def find_availability
    Resque.enqueue(PullAvailabilityAttendee, self.id)
  end

  def self.find_attendees_except_self(event_id_param, user_id_param)
    Attendee.where{(event_id.eq event_id_param) & (user_id.not_eq user_id_param)}
  end

end
