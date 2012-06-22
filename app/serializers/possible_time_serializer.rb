class PossibleTimeSerializer < ActiveModel::Serializer
  attributes :time_end, :time_start, :attendee_count, :possible_attendees_count
end
