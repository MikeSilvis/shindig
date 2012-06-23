class MenuSerializer < ActiveModel::Serializer
  attributes :id, :liked
  has_one :restaraunt
end
