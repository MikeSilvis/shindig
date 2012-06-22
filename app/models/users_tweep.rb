class UsersTweep < ActiveRecord::Base
  attr_accessible :tweep_id, :user_id

  belongs_to :user
  belongs_to :tweep
end
