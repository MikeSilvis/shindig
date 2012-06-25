class Menu < ActiveRecord::Base
  attr_accessible :event_id, :liked, :restaraunt_id
  belongs_to :event
  belongs_to :restaraunt

end
