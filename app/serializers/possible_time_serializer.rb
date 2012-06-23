class PossibleTimeSerializer < ActiveModel::Serializer
  attributes :time_end, :time_start, :possible_attendees_count
end
