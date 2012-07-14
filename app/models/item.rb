class Item < ActiveRecord::Base
  attr_accessible :category_id, :name, :quantity, :user_id, :event_id
  belongs_to :event
  belongs_to :category
  belongs_to :user
  validates_presence_of :user_id, :event_id, :category_id
end
