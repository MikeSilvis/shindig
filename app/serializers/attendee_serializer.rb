class AttendeeSerializer < ActiveModel::Serializer
  has_one :user
end
