class PossibleAttendee < ActiveRecord::Base
  attr_accessible :possible_time_id, :user_id
  validates_uniqueness_of :user_id, :scope => [:possible_time_id]
  belongs_to :user
end
