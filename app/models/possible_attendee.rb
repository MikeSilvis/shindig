class PossibleAttendee < ActiveRecord::Base
  attr_accessible :possible_time_id, :user_id, :event_id, :permanent
  validates_uniqueness_of :user_id, :scope => [:possible_time_id]
  belongs_to :user
  belongs_to :possible_time
  belongs_to :event
end