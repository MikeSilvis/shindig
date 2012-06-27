json.array!(@attendees) do |json, attendee|
  json.attendee attendee.id
  json.menu_id attendee.menu_id
  json.event_id attendee.event_id
  json.user attendee.user, :name, :username, :avatar, :email
end