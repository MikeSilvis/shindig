class PossibleTime < ActiveRecord::Base
  attr_accessible :event_id, :time_end, :time_start
  belongs_to :event
  has_many :possible_attendees
  after_create :find_availability
  after_update :find_availability

  def self.find_for(event_id)
    PossibleTime.find_all_by_event_id(event_id)
  end

  def possible_attendees_count
    possible_attendees.count || 0
  end

  def find_availability
     Resque.enqueue(PullAvailabilityTime, self.id)
  end

  def time_start_formatted()
    time_start.localtime.strftime("%I:%M %p")
  end

  def time_end_formatted()
    time_end.localtime.strftime("%I:%M %p")
  end

  def user_is_available?(user_id)
    @resp = false
    possible_attendees.each do |pa|
      @resp = true if pa.user_id == user_id
    end
    @resp
  end

  def self.format_spine_date(date_string)
    # "6/26/2012 1:30am EDT"
    DateTime.strptime(date_string, "%m/%d/%Y %I:%M%p %Z")
  end

  def self.verify_dates(start_param, end_param)
    start_param = PossibleTime.format_spine_date(start_param)
    end_param   = PossibleTime.format_spine_date(end_param)
    if start_param > end_param
      end_param = end_param + 1.days
    end
    [start_param, end_param]
  end

  def self.create_from_spine(pt, event_id)
    start_format, end_format = verify_dates(pt[:time_start], pt[:time_end])
    @possible_time = PossibleTime.create(
                                time_start: start_format,
                                time_end: end_format,
                                event_id: event_id)
    @possible_time
  end

end
