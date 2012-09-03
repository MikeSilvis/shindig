class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :menu_id, :owner
  belongs_to :event
  belongs_to :user
  belongs_to :menu
  after_create :find_availability
  validates_uniqueness_of :user_id, :scope => [:event_id]

  def self.add_event(token)
    event = Event.find_from_token(token)
    create(event_id: event.id)
  end

  def find_availability
    Thread.new { PullAvailabilityAttendee.perform(self.id) }
    # Resque.enqueue(PullAvailabilityAttendee, self.id)
  end

  def self.find_attendees_except_self(event_id_param, user_id_param)
    Attendee.where{(event_id.eq event_id_param) & (user_id.not_eq user_id_param)}.includes(:user)
  end

  def self.is_going_to?(event_id, user_id)
    Attendee.where(event_id: event_id, user_id: user_id).count == 1
  end
end