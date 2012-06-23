class Menu < ActiveRecord::Base
  attr_accessible :event_id, :integer, :liked, :restaraunt_id
  belongs_to :event
  belongs_to :restaraunt

end
