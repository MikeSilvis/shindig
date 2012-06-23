class PossibleTimeSerializer < ActiveModel::Serializer
  attributes :time_start, :time_end, :possible_attendees_count
end
