class PossibleTime < ActiveRecord::Base
  attr_accessible :event_id, :time_end, :time_start
  belongs_to :event
  has_many :possible_attendees
  after_create :find_availability

  def self.find_for(event_id)
    PossibleTime.find_all_by_event_id(event_id)
  end

  def possible_attendees_count
    possible_attendees.count || 0
  end

  def find_availability
     Resque.enqueue(PullAvailability, id)
  end

end
