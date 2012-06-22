class Availability < ActiveRecord::Base
  attr_accessible :time_end, :time_start, :user_id
  validates_uniqueness_of :user_id, :scope => [:time_end, :time_start]
  belongs_to :user
end
