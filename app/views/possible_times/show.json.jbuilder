json.id @possible_time.id
json.event_id @possible_time.event_id
json.date @possible_time.time_start.strftime("%a %b %d")
json.time_start @possible_time.time_start.strftime("%l:%m %p")
json.time_end @possible_time.time_end.strftime("%l:%m %p")
json.total_attendees @possible_time.possible_attendees_count
json.possible_attendees @possible_time.possible_attendees do |json, attendee|
  json.name attendee.user.name
  json.username attendee.user.username
  json.avatar attendee.user.avatar
  json.email attendee.user.email
end