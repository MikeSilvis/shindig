class PossibleTime < ActiveRecord::Base
  attr_accessible :event_id, :time_end, :time_start
  belongs_to :event
  has_many :possible_attendees
  after_create :find_availability

  def possible_attendees_count
    possible_attendees.count || 0
  end

  def find_availability
     Resque.enqueue(PullAvailability, id)
  end

end
