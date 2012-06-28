class PossibleAttendee < ActiveRecord::Base
  attr_accessible :possible_time_id, :user_id, :event_id, :permanent
  validates_uniqueness_of :user_id, :scope => [:possible_time_id]
  belongs_to :user
  belongs_to :possible_time
  belongs_to :event

  def self.create_for_user(time_id, event_id, user_id)
  	pa = PossibleAttendee.where(possible_time_id: time_id, event_id: event_id,
							 						 user_id: user_id).first_or_initialize
    pa.visible = true
    pa.save
  end

  def self.setInvisible(possible_attendee_id)
    pa = PossibleAttendee.find(possible_attendee_id)
    pa.visible = false
    pa.save
  end

end