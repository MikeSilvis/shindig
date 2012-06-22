class EventSerializer < ActiveModel::Serializer
  attributes :id, :city, :description, :name, :state, :street, :user_id, :zipcode, :created_at, :updated_at
  has_many :attendees, :messages, :possible_times
end
