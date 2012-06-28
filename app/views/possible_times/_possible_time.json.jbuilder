json.id possible_time.id
json.event_id possible_time.event_id
json.title ""
json.start possible_time.time_start.localtime
json.end possible_time.time_end.localtime
json.total_attendees possible_time.possible_attendees_count
json.time_start_hours possible_time.time_start_formatted
json.time_end_hours possible_time.time_end_formatted
json.date possible_time.time_start.strftime("%b %d")
json.available possible_time.user_is_available?(current_user.id)
json.current_user_attendee_id possible_time.find_specific_attendee(current_user.id)
json.possible_attendees possible_time.visible_attendees do |json, attendee|
  json.name attendee.user.name
  json.username attendee.user.username
  json.avatar attendee.user.avatar
  json.permanent attendee.permanent
  json.email attendee.user.email
end