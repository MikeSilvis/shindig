class RestarauntSerializer < ActiveModel::Serializer
  attributes :id, :name, :ls_id, :address, :lat, :long
end