json.array!(@possible_times) do |json, possible_time|
  json.id possible_time.id
  json.event_id possible_time.event_id
  json.title ""
  json.start possible_time.time_start.localtime
  json.end possible_time.time_end.localtime
end