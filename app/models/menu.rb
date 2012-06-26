class Menu < ActiveRecord::Base
  attr_accessible :event_id, :liked, :restaraunt_id, :name
  belongs_to :event
  belongs_to :restaraunt

end
