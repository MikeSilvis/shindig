class Message < ActiveRecord::Base
  attr_accessible :content, :event_id, :user_id
  belongs_to :user
  belongs_to :event
end
