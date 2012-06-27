class Menu < ActiveRecord::Base
  attr_accessible :event_id, :restaraunt_id, :name
  belongs_to :event
  belongs_to :restaraunt

  def liked_count
    Attendee.where(menu_id: id).count
  end

end
