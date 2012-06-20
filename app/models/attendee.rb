class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :user_id
  belongs_to :event
  belongs_to :user

  def self.add_event(token)
    event = Event.find_from_token(token)
    create(event_id: event.id)
  end

end
